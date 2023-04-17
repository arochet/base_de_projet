import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'num_utils.dart';
import 'object_utils.dart';
import 'text_utils.dart';

class AppDateUtils {
  static const String SERVER_DATE_FORMAT = 'dd/MM/yyyy';
  static const String SERVER_DATE_TIME_FORMAT = 'dd/MM/yyyy HH:mm:ss';

  static const String READABLE_DATE_WITH_TIME_FORMAT = 'dd.MM.yy HH:mm';

  const AppDateUtils._();

  static String formatDate(DateTime? date, [String? format]) {
    if (date == null) {
      return '';
    }

    DateFormat formatter = DateFormat(format ?? 'dd.MM.yy', 'fr');
    return formatter.format(date);
  }

  static DateTime? parseDate(String? date, String format) {
    if (TextUtils.isEmpty(date)) {
      return null;
    }

    if (date?.startsWith('/Date') == true) {
      // Ex: \/Date(1492639200000+0200)\/
      return DateTime.fromMillisecondsSinceEpoch(
        NumUtils.parseNullableInt(
          date!.substring(
            date.indexOf('(') + 1,
            date.indexOf('\+'),
          ),
        )!,
      );
    }

    DateFormat formatter = DateFormat(format);
    return formatter.parse(date!, true);
  }

  static DateTime? parseDateWithTimeIfPossible(String date) {
    try {
      return parseDateWithTime(date);
    } catch (_) {
      return parseNullableDateOnly(date);
    }
  }

  static DateTime? parseNullableDateWithTime(Object? date) {
    if (date == null) {
      return null;
    } else {
      return parseDateWithTime(date);
    }
  }

  static DateTime? parseDateWithTime(Object? date) {
    if (date is! String || TextUtils.isEmpty(date)) {
      return null;
    }

    if (date.contains('T')) {
      return parseDate(date, 'yyyy-MM-dd\'T\'HH:mm:ss');
    } else if (date.length == 10) {
      return parseDate(date, 'dd/MM/yyyy');
    } else {
      return parseDate(date, 'dd/MM/yyyy HH:mm:ss');
    }
  }

  static DateTime parseDateOnly(Object? date) {
    return ObjectUtils.returnOrThrow(
      () => parseNullableDateOnly(date),
      exception: 'Empty date!',
    );
  }

  static DateTime? parseNullableDateOnly(Object? date) {
    String? format = null;

    if (date is! String || TextUtils.isEmpty(date)) {
      return null;
    } else if (date.contains('jour')) {
      int days = NumUtils.parseNullableInt(date.split(' ')[0])!;
      return DateTime.now().subtract(Duration(days: days));
    } else if (date.endsWith('j')) {
      int days = NumUtils.parseNullableInt(
        date.substring(0, date.length - 2).replaceAll(' ', ''),
      )!;
      return DateTime.now().subtract(Duration(days: days));
    } else if (date.length < 10) {
      var parts = date.split('/');
      date = '${parts[0]}/${parts[1]}/20${parts[2]}';
    } else if (date.contains('T') && date.length == 23) {
      date = date.substring(0, 10);
      format = 'yyyy-MM-dd';
    }

    return parseDate(
      date.replaceAll('-', '/'),
      format?.replaceAll('-', '/') ?? 'dd/MM/yyyy',
    );
  }

  static DateTime? parseTimeStamp(Object? timestamp) {
    if (timestamp == null) {
      return null;
    } else if (timestamp is DateTime) {
      return timestamp;
    } else if (timestamp is String) {
      return DateTime.fromMillisecondsSinceEpoch(NumUtils.parseNullableInt(timestamp)!);
    } else if (timestamp is int) {
      return DateTime.fromMillisecondsSinceEpoch(timestamp);
    } else {
      return null;
    }
  }

  /// Difference in days (including partial days) between now and [date]
  static int diffInDays(DateTime date) {
    var now = DateTime.now();
    return diffInDaysWith(DateTime.utc(now.year, now.month, now.day), date);
  }

  /// Difference in days (including partial days) between [date1] and [date2]
  static int diffInDaysWith(DateTime date1, DateTime date2) {
    // inDays only returns whole day
    int hours = date1.difference(date2).inHours;
    int res = (hours ~/ 24);
    int diff = (hours % 24);

    if (hours < 0) {
      return res - (diff != 0 ? 1 : 0);
    } else {
      return res + (diff != 0 ? 1 : 0);
    }
  }

  static int diffInMonths(DateTime date1, DateTime date2) {
    return _diffInMonths(date: date1, other: date2);
  }

  static DiffInMonths diffInMonthsAndDays(DateTime date) {
    return diffInMonthsAndDaysWith(date, DateTime.now());
  }

  static DiffInMonths diffInMonthsAndDaysWith(DateTime date1, DateTime date2) {
    date1 = DateTime(date1.year, date1.month, date1.day);
    date2 = DateTime(date2.year, date2.month, date2.day);

    int days = _diffInDays(x: date1, y: date2);

    if ((days >= 0 && days <= 31) || (days < 0 && days > -31)) {
      return DiffInMonths(0, days);
    }

    int remainingDays;

    if (date2.day < date1.day) {
      remainingDays = _diffInDays(x: DateTime(date2.year, date2.month - 1, date1.day), y: date2) - 1;
    } else {
      remainingDays = _diffInDays(x: DateTime(date2.year, date2.month, date1.day), y: date2);
    }

    return DiffInMonths(_diffInMonths(date: date1, other: date2), remainingDays);
  }

  static bool isToday(DateTime date) {
    DateTime now = DateTime.now();
    return date.day == now.day && date.month == now.month && date.year == now.year;
  }

  static DateTime? fromTimestamp(int? date) {
    if (date == null) {
      return null;
    }

    return DateTime.fromMillisecondsSinceEpoch(date);
  }

  static int? toTimestamp(DateTime? date) {
    if (date == null) {
      return null;
    } else {
      return date.millisecondsSinceEpoch;
    }
  }

  static DateTime get todayAtMidnight {
    DateTime today = DateTime.now();
    return DateTime(today.year, today.month, today.day);
  }

  static DateTime get tomorrow {
    return DateTime.now().add(const Duration(days: 1));
  }

  static int _diffInDays({required DateTime x, required DateTime y}) {
    x = x.toUtc();
    y = y.toUtc();
    return x.difference(y).inDays;
  }

  static int _diffInMonths({required DateTime date, DateTime? other}) {
    other ??= DateTime.now();

    final DateTime e = date.isBefore(other) ? date : other;
    final DateTime l = date.isBefore(other) ? other : date;

    int result = (l.year - e.year) * 12 +
        (l.month - e.month) +
        (date.clone(year: l.year, month: l.month).isAfter(l) ? -1 : 0);

    if (date.isBefore(other)) {
      return -result;
    } else {
      return result;
    }
  }

  static String formatDays(int sum, BuildContext context, {bool minLabels = false}) {
    StringBuffer buffer = StringBuffer();

    int months = sum ~/ 31;
    int days = sum ~/ 31;

    if (months != 0) {
      buffer.write(months < 0 ? -months : months);
      buffer.write(' ');

      if (months == 1 || months == -1) {
        buffer.write(
          minLabels ? 'AppLocalizations.of(context)!.month_single_min' : 'AppLocalizations.of(context)!.mois',
        );
      } else {
        buffer.write(
          minLabels
              ? 'AppLocalizations.of(context)!.month_plural_min'
              : 'AppLocalizations.of(context)!.month_plural',
        );
      }

      buffer.write(' ');
    }

    if (days != 0) {
      buffer.write(days < 0 ? -days : days);
      buffer.write(' ');

      if (days == 1 || days == -1) {
        buffer.write(minLabels
            ? 'AppLocalizations.of(context)!.day_single_min'
            : 'AppLocalizations.of(context)!.day_single');
      } else {
        buffer.write(minLabels
            ? 'AppLocalizations.of(context)!.day_plural_min'
            : 'AppLocalizations.of(context)!.day_plural');
      }
    }

    return buffer.toString();
  }

  static DateTime min(DateTime d1, DateTime d2) {
    if (d1.isSameDayOrBefore(d2)) {
      return d1;
    } else {
      return d2;
    }
  }

  static DateTime max(DateTime d1, DateTime d2) {
    if (d1.isSameDayOrAfter(d2)) {
      return d1;
    } else {
      return d2;
    }
  }

  static DateTime todayWith(num days) => DateTime.now().addDays(NumUtils.parseNullableInt(days, 0)!);
}

class DiffInMonths {
  final int months;
  final int days;

  DiffInMonths(this.months, this.days);

  String format(BuildContext context) {
    StringBuffer buffer = StringBuffer();

    if (months == 0 && days == 0) {
      return 'sdf';
      //return AppLocalizations.of(context)!.qsdf;
    }

    if (months != 0) {
      buffer.write(months < 0 ? -months : months);
      buffer.write('\u00A0');

      if (months == 1 || months == -1) {
        buffer.write('AppLocalizations.of(context)!.month_single');
      } else {
        buffer.write('AppLocalizations.of(context)!.month_plural');
      }

      buffer.write(' ');
    }

    if (days != 0) {
      buffer.write(days < 0 ? -days : days);
      buffer.write('\u00A0');

      if (days == 1 || days == -1) {
        buffer.write('AppLocalizations.of(context)!.day_single');
      } else {
        buffer.write('AppLocalizations.of(context)!.day_plural');
      }
    }

    return buffer.toString();
  }

  @override
  String toString() {
    return 'DiffInMonths{months: $months, days: $days}';
  }
}

extension DateUtilsExtensions on DateTime {
  int toTimestamp() {
    return this.millisecondsSinceEpoch;
  }

  DateTime clone({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) =>
      DateTime(
        year ?? this.year,
        month ?? this.month,
        day ?? this.day,
        hour ?? this.hour,
        minute ?? this.minute,
        second ?? this.second,
        millisecond ?? this.millisecond,
        microsecond ?? this.microsecond,
      );

  DateTime toDate() => DateTime(year, month, day);

  bool isBeforeNow() => isBefore(DateTime.now());

  bool isAfterNow() => isBefore(DateTime.now());

  bool isSameDayOrBefore(DateTime other) {
    return this == other || isBefore(other);
  }

  bool isSameDayOrAfter(DateTime other) {
    return this == other || isAfter(other);
  }

  bool isSameDayAs(DateTime other) {
    return this.year == other.year && this.month == other.month && this.day == other.day;
  }

  DateTime subtractMonths(int months) => clone(
        year: this.year,
        month: this.month - months,
        day: this.day,
        hour: this.hour,
        minute: this.minute,
        second: this.second,
        millisecond: this.millisecond,
        microsecond: this.microsecond,
      );

  DateTime addMonths(int months) => clone(
        year: this.year,
        month: this.month + months,
        day: this.day,
        hour: this.hour,
        minute: this.minute,
        second: this.second,
        millisecond: this.millisecond,
        microsecond: this.microsecond,
      );

  DateTime addDays(num days) => add(Duration(days: NumUtils.parseNullableInt(days)!));

  bool isToday() => isSameDayAs(DateTime.now());
}

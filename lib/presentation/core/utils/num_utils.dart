import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'object_utils.dart';

class NumUtils {
  const NumUtils._();

  static bool isNum(dynamic value) {
    try {
      if (value is num) {
        return true;
      } else {
        return parseNullableNum(value) != null;
      }
    } catch (e) {
      return false;
    }
  }

  static double parseDouble(dynamic value) {
    return ObjectUtils.returnOrThrow(
      () => parseNullableDouble(value),
      exception: 'Value is null!',
    );
  }

  static double? parseNullableDouble(dynamic value, [double? defaultValue, bool acceptNull = false]) {
    if (value is double) {
      return value;
    } else if (value is num) {
      return value.toDouble();
    } else if (value is String) {
      return double.tryParse(value.replaceAll(' ', '').replaceAll(',', '.'));
    } else if (value is TextEditingValue) {
      return parseNullableDouble(value.text);
    } else if (defaultValue != null) {
      return defaultValue;
    } else if (value == null && acceptNull) {
      return defaultValue;
    } else {
      return null;
    }
  }

  static int parseInt(
    dynamic value, [
    int defaultValue = 0,
  ]) {
    return ObjectUtils.returnOrThrow(
      () => parseNullableInt(value, defaultValue),
      exception: 'Value is null!',
    );
  }

  static int? parseNullableInt(
    dynamic value, [
    int? defaultValue,
    bool acceptNull = false,
  ]) {
    if (value is int) {
      return value;
    } else if (value is num) {
      return value.toInt();
    } else if (value is String) {
      return int.tryParse(value.replaceAll(' ', ''));
    } else if (value is TextEditingValue) {
      return parseNullableInt(value.text);
    } else if (defaultValue != null) {
      return defaultValue;
    } else if (value == null && acceptNull) {
      return defaultValue;
    } else {
      return null;
    }
  }

  static num parseNum(dynamic value) {
    return ObjectUtils.returnOrThrow(
      () => parseNullableNum(value),
      exception: 'Value is null!',
    );
  }

  static num? parseNullableNum(
    dynamic value, [
    num? defaultValue,
    bool acceptNull = false,
  ]) {
    if (value is num) {
      return value;
    } else if (value is String) {
      return num.tryParse(value.replaceAll(' ', '').replaceAll(',', '.'));
    } else if (defaultValue != null) {
      return defaultValue;
    } else if (value == null && acceptNull) {
      return defaultValue;
    } else {
      return null;
    }
  }

  static String toStringAsSignedFixed(num? num, [int fractionDigits = 1]) {
    if (num == null) {
      return '';
    }
    return '${num > 0 ? '+' : ''}${num.toString().replaceFirst('.0', '').replaceFirst('.', ',')}';
  }

  static String? toFormattedString(num? num, [int? digits = 0]) {
    if (num == null) {
      return null;
    }

    if (num is double && digits == 0) {
      return NumberFormat.decimalPattern('fr').format(num);
    } else {
      if (digits == 0) {
        return num.toString();
      } else {
        return NumberFormat('####.${List.filled(digits ?? 3, '0').join()}', 'fr').format(num);
      }
    }
  }

  static int? extractFractionalPart(num num) {
    if (num is int) {
      return 0;
    }

    return parseNullableInt(num.toString().split('.')[1]);
  }

  static String toCustomFormatString(
    num? num,
    String format, [
    bool includeZero = true,
  ]) {
    if (num == null) {
      return '';
    }

    bool negative = num < 0;
    if (negative) {
      num = -num;
    }

    String res = NumberFormat(format, 'fr').format(num).trim();

    if (res.length != format.length) {
      int resLength = res.length;

      int r = resLength - 1;

      StringBuffer buffer = StringBuffer();
      for (int i = format.length - 1; i >= 0; i--) {
        if (format[i] == '0' || format[i] == '#') {
          if (r >= 0) {
            buffer.write(res[r]);
          } else if (includeZero) {
            buffer.write('0');
          }
          r--;
        } else {
          buffer.write(format[i]);
        }
      }

      while (r >= 0) {
        buffer.write(res[r]);
        r--;
      }

      res = buffer.toString().split('').reversed.join('').trim();
    }

    if (negative) {
      return '-$res';
    } else {
      return res;
    }
  }
}

extension NumExtensions on num {
  int get digits => toString().length;
}

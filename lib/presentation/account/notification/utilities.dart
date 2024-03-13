import 'package:flutter/material.dart';

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

class NotificationWeekAndTime {
  final TimeOfDay timeOfDay;

  NotificationWeekAndTime({
    required this.timeOfDay,
  });
}

Future<NotificationWeekAndTime?> pickSchedule(
  BuildContext context,
) async {
  TimeOfDay? timeOfDay;
  DateTime now = DateTime.now();

  timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
        now.add(
          Duration(minutes: 1),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: Colors.teal,
            ),
          ),
          child: child!,
        );
      });

  if (timeOfDay != null) {
    return NotificationWeekAndTime(timeOfDay: timeOfDay);
  }
}

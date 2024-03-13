import 'package:auto_route/auto_route.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:base_de_projet/PRESENTATION/core/components/main_scaffold.dart';
import 'package:base_de_projet/PRESENTATION/core/components/show_component_file.dart';
import 'package:base_de_projet/providers.dart';

import 'utilities.dart';

@RoutePage()
class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationPage> {
  List<NotificationModel> listNotifications = [];
  bool isNotificationAllowed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      print('isNotificationAllowed $isNotificationAllowed');
      isNotificationAllowed = await AwesomeNotifications().isNotificationAllowed();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: AppLocalizations.of(context)!.notification,
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
              child: Card(
                  child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              //mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(AppLocalizations.of(context)!.notification,
                        style: Theme.of(context).textTheme.bodyMedium),
                    Expanded(child: Container()),
                    Text(
                        isNotificationAllowed
                            ? AppLocalizations.of(context)!.active
                            : AppLocalizations.of(context)!.desactive,
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
                const Gap(10),

                //Bouton Ajouter une nouvelle notification
                ElevatedButton(
                  onPressed: () async {
                    //On vérifie que l'on a bien les autorisations d'envoie des notifications
                    AwesomeNotifications().requestPermissionToSendNotifications();

                    await createPlantFoodNotification();
                  },
                  child: Text("Test notification"),
                ),
              ],
            ),
          ))),
        ),
      ),
    );
  }
}

/////// !!!!!!!!!  EXAMPLE !!!!!! ////////
Future<void> createPlantFoodNotification() async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'scheduled_channel',
          title: ' Buy Plant Food !!',
          icon: null,
          body: 'Florist at 123, Main St. has 2 in stock',
          bigPicture: 'asset://assets/notification_map.png',
          notificationLayout: NotificationLayout.BigPicture));
}

Future<void> createReminderNotification(NotificationWeekAndTime notificationScheduled) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'scheduled_channel',
      title: 'Base de projet',
      body: '',
      notificationLayout: NotificationLayout.Default,
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'MARK_DONE',
        label: 'Mark Done',
      )
    ],
    schedule: NotificationCalendar(
      weekday: DateTime.now().weekday,
      hour: notificationScheduled.timeOfDay.hour,
      minute: notificationScheduled.timeOfDay.minute,
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> cancelScheduledNotifications() async {
  await AwesomeNotifications().cancelAllSchedules();
}

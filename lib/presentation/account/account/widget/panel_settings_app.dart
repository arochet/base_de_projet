import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:base_de_projet/PRESENTATION/core/components/dialogs.dart';
import 'package:base_de_projet/PRESENTATION/core/core/router.dart';
import 'package:base_de_projet/PRESENTATION/core/utils/dev_utils.dart';
import 'package:base_de_projet/providers.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'panel_list.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PanelSettingsApp extends ConsumerWidget {
  const PanelSettingsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PanelList(
      title: 'PanelSettingsApp',
      list: [
        /* ItemPanelList(
          title: AppLocalizations.of(context)!.language,
          icon: Icons.flag,
          onTap: () {
            printDev();
            context.router.push(LangueRoute());
          },
        ), */
        ItemPanelList(
          title: AppLocalizations.of(context)!.notification,
          icon: Icons.notifications,
          enabled: ref.watch(allowNotification),
          setSwitch: (value) async {
            if (value == true) {
              if (await AwesomeNotifications().isNotificationAllowed() == false) {
                final bool? ok = await showDialogChoix(
                    context, AppLocalizations.of(context)!.activez_les_notifications_dans_les_reglages,
                    positiveText: AppLocalizations.of(context)!.reglages,
                    negativeText: AppLocalizations.of(context)!.annuler);

                if (ok == true) {
                  AwesomeNotifications().requestPermissionToSendNotifications();
                }

                return;
              }
            }
            ref.read(allowNotification.notifier).state = value ?? false;
          },
          onTap: () {
            printDev();
            //context.router.push(NotificationRoute());
          },
        ),
        ItemPanelList(
          title: AppLocalizations.of(context)!.envoyerunretour,
          icon: Icons.border_color,
          onTap: () {
            printDev();
            BetterFeedback.of(context).show(
              (feedback) async {
                // upload to server, share whatever
                // for example purposes just show it to the user
                final screenshotFilePath = await writeImageToStorage(feedback.screenshot);

                final Email email = Email(
                  body: feedback.text,
                  subject: 'App Feedback',
                  recipients: ['arochet@digital-village.fr'],
                  attachmentPaths: [screenshotFilePath],
                  isHTML: false,
                );
                await FlutterEmailSender.send(email);
              },
            );
          },
        ),
      ],
    );
  }

  Future<String> writeImageToStorage(Uint8List feedbackScreenshot) async {
    final Directory output = await getApplicationDocumentsDirectory();
    final String screenshotFilePath = '${output.path}/feedback.png';
    final File screenshotFile = File(screenshotFilePath);
    await screenshotFile.writeAsBytes(feedbackScreenshot);
    return screenshotFilePath;
  }
}

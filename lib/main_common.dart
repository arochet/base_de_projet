import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:base_de_projet/firebase_options.dart';
import 'package:base_de_projet/providers.dart';
import 'package:feedback/feedback.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:base_de_projet/injection.dart';
import 'package:base_de_projet/PRESENTATION/core/core/app_widget.dart';

import 'PRESENTATION/core/utils/dev_utils.dart';
import 'config_reader.dart';

Future<void> mainCommon(Environment env) async {
  configurationInjection(env.name);
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();

  //Notifications
  //Notifications
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'scheduled_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(channelGroupKey: 'basic_channel_group', channelGroupName: 'Basic group')
      ],
      debug: true);

  await Firebase.initializeApp(
    name: 'base-de-projet',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //Sert à afficher les logs en mode dev
  getIt.registerSingleton<AppLog>(AppLog());

  runApp(MainApp(env: env));
}

class MainApp extends StatelessWidget {
  final Environment env;
  const MainApp({
    Key? key,
    required this.env,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BetterFeedback(
      child: ProviderScope(
        overrides: [environment.overrideWith((ref) => env)],
        child: AppWidget(),
      ),
    );
  }
}

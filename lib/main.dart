import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:base_de_projet/injection.dart';
import 'package:base_de_projet/presentation/core/app_widget.dart';

Future<void> main() async {
  configurationInjection(Environment.prod);
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(AppWidget());
}

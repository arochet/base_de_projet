import 'package:admin/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:admin/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'ADMIN_PRESENTATION/core/core/app_widget.dart';

void main() async {
  //ADMIN
  configurationInjection(Environment.prod); //Configuration de GetIt
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'base-de-projet',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: AppWidget()));
}

import 'package:base_de_projet/application/auth/auth_notifier.dart';
import 'package:base_de_projet/application/auth/sign_in_form_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'infrastructure/auth/auth_repository.dart';
import 'injection.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => getIt<AuthRepository>());

final signInFormNotifierProvider = StateNotifierProvider(
  (ref) => SignInFormNotifier(ref.watch(authRepositoryProvider)),
);

final authNotifierProvider = StateNotifierProvider(
  (ref) => AuthNotifier(ref.watch(authRepositoryProvider)),
);

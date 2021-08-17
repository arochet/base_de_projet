import 'package:base_de_projet/application/auth/auth_notifier.dart';
import 'package:base_de_projet/application/auth/register_form_notifier.dart';
import 'package:base_de_projet/application/auth/sign_in_form_notifier.dart';
import 'package:base_de_projet/domain/auth/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/core/errors.dart';
import 'infrastructure/auth/auth_repository.dart';
import 'injection.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => getIt<AuthRepository>());

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) =>
      AuthNotifier(ref.watch(authRepositoryProvider))..authCheckRequested(),
);

final signInFormNotifierProvider =
    StateNotifierProvider.autoDispose<SignInFormNotifier, SignInFormData>(
  (ref) => SignInFormNotifier(ref.watch(authRepositoryProvider)),
);

final registerFormNotifierProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormData>(
  (ref) => RegisterFormNotifier(ref.watch(authRepositoryProvider)),
);

final currentUser = FutureProvider.autoDispose<User>((ref) async {
  final userOption = await getIt<AuthRepository>().getSignedUser();
  return userOption.getOrElse(() => throw NotAuthenticatedError);
});

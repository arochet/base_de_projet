import 'package:base_de_projet/application/auth/auth_notifier.dart';
import 'package:base_de_projet/application/auth/modify_form_notifier.dart';
import 'package:base_de_projet/application/auth/register_form_notifier.dart';
import 'package:base_de_projet/application/auth/sign_in_form_notifier.dart';
import 'package:base_de_projet/domain/auth/user_auth.dart';
import 'package:base_de_projet/domain/auth/user_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/core/errors.dart';
import 'infrastructure/auth/auth_repository.dart';
import 'injection.dart';

//AUTHENTIFICATION
final authRepositoryProvider =
    Provider<AuthRepository>((ref) => getIt<AuthRepository>());

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) =>
      AuthNotifier(ref.watch(authRepositoryProvider))..authCheckRequested(),
);

//CONNEXION / REGISTER / MODIFY
final signInFormNotifierProvider =
    StateNotifierProvider.autoDispose<SignInFormNotifier, SignInFormData>(
  (ref) => SignInFormNotifier(ref.watch(authRepositoryProvider)),
);

final registerFormNotifierProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormData>(
  (ref) => RegisterFormNotifier(ref.watch(authRepositoryProvider)),
);

final modifyFormNotifierProvider =
    StateNotifierProvider.autoDispose<ModifyFormNotifier, ModifyFormData>(
  (ref) => ModifyFormNotifier(ref.watch(authRepositoryProvider)),
);

//USER
final currentUser = FutureProvider.autoDispose<UserAuth>((ref) async {
  final userOption = await getIt<AuthRepository>().getSignedUser();
  return userOption.getOrElse(() => throw NotAuthenticatedError);
});

final currentUserData = FutureProvider.autoDispose<UserData?>((ref) async {
  ref.watch(currentUser);
  final userOption = await getIt<AuthRepository>().getUserData();
  final user = userOption.getOrElse(() => UserData.empty());

  if (user == UserData.empty() || userOption.isNone())
    return null;
  else
    return user;
});

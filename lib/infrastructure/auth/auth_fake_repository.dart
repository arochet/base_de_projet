import 'dart:io';

import 'package:base_de_projet/domain/auth/auth_failure.dart';
import 'package:base_de_projet/domain/auth/delete_failure.dart';
import 'package:base_de_projet/domain/auth/new_password_failure.dart';
import 'package:base_de_projet/domain/auth/reauthenticate_failure.dart';
import 'package:base_de_projet/domain/auth/reset_password_failure.dart';
import 'package:base_de_projet/domain/auth/server_failure.dart';
import 'package:base_de_projet/domain/auth/user_data.dart';
import 'package:base_de_projet/domain/auth/value_objects.dart';
import 'package:base_de_projet/domain/core/value_objects.dart';
import 'package:base_de_projet/infrastructure/core/crypt.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:base_de_projet/domain/auth/user_auth.dart';
import 'package:injectable/injectable.dart';
import 'auth_repository.dart';

@LazySingleton(as: AuthRepository, env: [Environment.test])
class FakeAuthFacade implements AuthRepository {
  UserData _userData = UserData(
    id: UniqueId.fromUniqueString("test"),
    userName: Nom("testName"),
    email: EmailAddress("test@yopmail.com"),
    passwordCrypted: true,
    typeAccount: TypeAccount(TypeAccountState.email),
  );

  FakeAuthFacade();

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required UserData userData,
      required EmailAddress emailAddress,
      required Password password}) async {
    return right(unit);
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAddress emailAdress, required Password password}) async {
    return right(unit);
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    return right(unit);
  }

  @override
  Future<Option<UserAuth>> getSignedUser() async =>
      some(UserAuth(id: UniqueId.fromUniqueString("test")));

  @override
  bool isUserEmailVerified() {
    return true;
  }

  @override
  Future<void> signOut() => Future.delayed(Duration(seconds: 1));

  @override
  Future<Option<UserData>> getUserData() async {
    return some(_userData);
  }

  @override
  Future<Option<UserData>> getUserDataWithId(UniqueId idPlayer) async {
    if (idPlayer.getOrCrash() == "test")
      return some(_userData);
    else
      return some(UserData(
        id: idPlayer,
        userName: Nom("kaspa"),
        email: EmailAddress("test2@yopmail.com"),
        passwordCrypted: true,
        typeAccount: TypeAccount(TypeAccountState.email),
      ));
  }

  @override
  Future<Either<AuthFailure, Unit>> modifyAccount({
    required Nom userName,
  }) async {
    _userData = _userData.copyWith(
      userName: userName,
    );
    return right(unit);
  }

  @override
  Future<Either<DeleteFailure, Unit>>
      deleteAccountWithEmailAndPassword() async {
    return right(unit);
  }

  @override
  Future<Either<ReauthenticateFailure, Unit>> reauthenticateWithPassword(
      {required Password password}) async {
    return right(unit);
  }

  @override
  Future<Either<NewPasswordFailure, Unit>> newPassword(
      {required Password newPassword}) async {
    return right(unit);
  }

  @override
  Option<User> getUser() => none();

  @override
  Future<void> sendEmailVerification() async {
    getUser().fold(
      () => throw UnimplementedError(),
      (user) => user.sendEmailVerification(),
    );
  }

  @override
  Future<Either<ResetPasswordFailure, Unit>> resetPassword(
      {required EmailAddress emailAddress}) async {
    return right(unit);
  }

  Future<String> getPasswordConverted(
      String emailAdress, String password) async {
    return crypt(password);
  }

  @override
  Future<Either<ServerFailure, Unit>> uploadPhotoProfile(File file) async {
    return right(unit);
  }

  @override
  Future<Image?> getPhotoProfile() async {
    return null;
  }

  @override
  Future<Image?> getPhotoProfileOfPlayer(UniqueId idPlayer) async {
    return null;
  }
}

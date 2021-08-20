import 'package:base_de_projet/domain/auth/auth_failure.dart';
import 'package:base_de_projet/domain/auth/delete_failure.dart';
import 'package:base_de_projet/domain/auth/new_password_failure.dart';
import 'package:base_de_projet/domain/auth/reauthenticate_failure.dart';
import 'package:base_de_projet/domain/auth/user_data.dart';
import 'package:base_de_projet/domain/auth/value_objects.dart';
import 'package:base_de_projet/infrastructure/auth/user_data_dtos.dart';
import 'package:base_de_projet/infrastructure/core/crypt.dart';
import 'package:base_de_projet/infrastructure/core/firestore_helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:base_de_projet/domain/auth/user_auth.dart';
import 'package:injectable/injectable.dart';
import './firebase_user_mapper.dart';

abstract class AuthRepository {
  Future<Option<UserAuth>> getSignedUser();
  Future<Option<UserData>> getUserData();
  bool isUserEmailVerified();
  Option<User> getUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required UserData userData, required Password password});
  Future<Either<AuthFailure, Unit>> modifyAccount({required UserData userData});
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAddress emailAdress, required Password password});
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> sendEmailVerification();
  Future<Either<DeleteFailure, Unit>> deleteAccountWithEmailAndPassword();
  Future<Either<ReauthenticateFailure, Unit>> reauthenticateWithPassword(
      {required Password password});
  Future<Either<NewPasswordFailure, Unit>> newPassword(
      {required Password newPassword});
  Future<void> signOut();
}

/// ATTENTION A REVOIR !!!!!!
@LazySingleton(as: AuthRepository)
class FirebaseAuthFacade implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  FirebaseAuthFacade(
    this._firebaseAuth,
    this._googleSignIn,
    this._firestore,
  );

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required UserData userData, required Password password}) async {
    final emailAdressStr = userData.email.getOrCrash();
    final passwordStr = password.getOrCrash();
    try {
      //Création compte firebase
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailAdressStr, password: crypt(passwordStr));
      try {
        await this.sendEmailVerification();
      } catch (e) {
        print("SendEmailVerification Fail");
        return left(AuthFailure.invalidUser());
      }
      try {
        //Création des datas Firestore
        final userDoc = await _firestore.userDocument();
        final userDataDTO = UserDataDTO.fromDomain(userData);

        await userDoc.set(userDataDTO.toJson());
      } on FirebaseException catch (e) {
        if (e.message!.contains('permission')) {
          return left(const AuthFailure.insufficientPermission());
        } else {
          print("erreur ${e.message}");
          return left(const AuthFailure.serverError());
        }
      } catch (e) {
        print("erreur2 $e");
        return left(const AuthFailure.serverError());
      }

      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAddress emailAdress, required Password password}) async {
    final emailAdressStr = emailAdress.getOrCrash();
    final passwordStr = password.getOrCrash();
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailAdressStr, password: crypt(passwordStr));
      return right(unit);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'wrong-password':
          return (left(const AuthFailure.invalidPassword()));
        case 'user-not-found':
          return (left(const AuthFailure.invalidUser()));
        case 'email-already-in-use':
          return (left(const AuthFailure.emailAlreadyInUse()));
        default:
          return left(const AuthFailure.serverError());
      }
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }
      final googleAuthentification = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
          idToken: googleAuthentification.idToken,
          accessToken: googleAuthentification.accessToken);
      await _firebaseAuth.signInWithCredential(authCredential);
      return right(unit);
    } on PlatformException catch (_) {
      return left(const AuthFailure.serverError());
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Option<UserAuth>> getSignedUser() async =>
      optionOf(_firebaseAuth.currentUser?.toDomain());

  @override
  bool isUserEmailVerified() {
    final user = _firebaseAuth.currentUser;
    return (user != null && user.emailVerified);
  }

  @override
  Future<void> signOut() => Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
      ]);

  @override
  Future<Option<UserData>> getUserData() async {
    final userDoc = await _firestore.userDocument();
    final docSnapshot = await userDoc.get();
    if (docSnapshot.exists) {
      return some(UserDataDTO.fromFirestore(docSnapshot).toDomain());
    }
    return none();
  }

  @override
  Future<Either<AuthFailure, Unit>> modifyAccount(
      {required UserData userData}) async {
    try {
      //Mis à jour des données de l'utilisateur Firestore
      final userDoc = await _firestore.userDocument();
      final userDataDTO = UserDataDTO.fromDomain(userData);

      await userDoc.set(userDataDTO.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission')) {
        return left(const AuthFailure.insufficientPermission());
      } else {
        return left(const AuthFailure.serverError());
      }
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<DeleteFailure, Unit>>
      deleteAccountWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        return left(const DeleteFailure.requiresRecentLogin());
      }
      return left(const DeleteFailure.serverError());
    }
  }

  @override
  Future<Either<ReauthenticateFailure, Unit>> reauthenticateWithPassword(
      {required Password password}) async {
    final userOption = await getUser();

    if (userOption.isNone())
      return left(ReauthenticateFailure.notAuthenticated());
    else
      return userOption.fold(
          () => left(const ReauthenticateFailure.serverError()), (user) async {
        AuthCredential credential = EmailAuthProvider.credential(
            email: user.email!, password: crypt(password.getOrCrash()));
        print(credential);

        try {
          // Reauthenticate
          await FirebaseAuth.instance.currentUser!
              .reauthenticateWithCredential(credential);
          return right(unit);
        } on FirebaseAuthException catch (e) {
          switch (e.code) {
            case 'user-mismatch':
              return (left(const ReauthenticateFailure.userMismatch()));
            case 'user-not-found':
              return (left(const ReauthenticateFailure.userNotFound()));
            case 'invalid-credential':
              return (left(const ReauthenticateFailure.invalidCredential()));
            case 'invalid-email':
              return (left(const ReauthenticateFailure.invalidEmail()));
            case 'wrong-password':
              return (left(const ReauthenticateFailure.wrongPassword()));
            case 'too-many-requests':
              return (left(const ReauthenticateFailure.tooManyRequest()));
            default:
              return (left(const ReauthenticateFailure.serverError()));
          }
        }
      });
  }

  @override
  Future<Either<NewPasswordFailure, Unit>> newPassword(
      {required Password newPassword}) async {
    final userOption = await getUser();
    if (userOption.isNone())
      return left(NewPasswordFailure.serverError());
    else {
      return userOption.fold(() => left(NewPasswordFailure.serverError()),
          (user) async {
        try {
          user.updatePassword(crypt(newPassword.getOrCrash()));
          return right(unit);
        } on FirebaseAuthException catch (e) {
          switch (e.code) {
            default:
              return (left(const NewPasswordFailure.serverError()));
          }
        }
      });
    }
  }

  @override
  Option<User> getUser() => optionOf(_firebaseAuth.currentUser);

  @override
  Future<void> sendEmailVerification() async {
    getUser().fold(
      () => throw UnimplementedError(),
      (user) => user.sendEmailVerification(),
    );
  }
}

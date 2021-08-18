import 'package:base_de_projet/domain/auth/auth_failure.dart';
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
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required UserData userData, required Password password});
  Future<Either<AuthFailure, Unit>> modifyAccount({required UserData userData});
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAddress emailAdress, required Password password});
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
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
        //Création des datas Firestore
        final userDoc = await _firestore.userDocument();
        final userDataDTO = UserDataDTO.fromDomain(userData);

        await userDoc.set(userDataDTO.toJson());
      } on FirebaseException catch (e) {
        if (e.message!.contains('permission')) {
          return left(const AuthFailure.insufficientPermission());
        } else {
          return left(const AuthFailure.serverError());
        }
      } catch (e) {
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
      if (e.code == "wrong-password" || e.code == "user-not-found") {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
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
      {required UserData userData}) {
    // TODO: implement modifyAccount
    throw UnimplementedError();
  }
}

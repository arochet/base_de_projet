import 'package:base_de_projet/domain/auth/auth_failure.dart';
import 'package:base_de_projet/domain/auth/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:base_de_projet/domain/auth/user.dart' as user;
import 'package:injectable/injectable.dart';
import './firebase_user_mapper.dart';

abstract class AuthRepository {
  Future<Option<user.User>> getSignedUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required EmailAddress emailAdress, required Password password});
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

  FirebaseAuthFacade(
    this._firebaseAuth,
    this._googleSignIn,
  );

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required EmailAddress emailAdress, required Password password}) async {
    final emailAdressStr = emailAdress.getOrCrash();
    final passwordStr = password.getOrCrash();
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailAdressStr, password: passwordStr);
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
          email: emailAdressStr, password: passwordStr);
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
  Future<Option<user.User>> getSignedUser() async =>
      optionOf(_firebaseAuth.currentUser?.toDomain());

  @override
  Future<void> signOut() => Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
      ]);
}

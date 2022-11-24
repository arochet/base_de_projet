// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_storage/firebase_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;

import 'INFRASTRUCTURE/auth/auth_fake_repository.dart' as _i4;
import 'INFRASTRUCTURE/auth/auth_repository.dart' as _i3;
import 'INFRASTRUCTURE/core/firebase_injectable_module.dart' as _i9;

const String _test = 'test';
const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.AuthRepository>(() => _i4.FakeAuthFacade(),
      registerFor: {_test});
  gh.lazySingleton<_i5.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i6.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i7.FirebaseStorage>(() => firebaseInjectableModule.storage);
  gh.lazySingleton<_i8.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<_i3.AuthRepository>(
      () => _i3.FirebaseAuthFacade(
          get<_i5.FirebaseAuth>(),
          get<_i8.GoogleSignIn>(),
          get<_i6.FirebaseFirestore>(),
          get<_i7.FirebaseStorage>()),
      registerFor: {_dev, _prod});
  return get;
}

class _$FirebaseInjectableModule extends _i9.FirebaseInjectableModule {}

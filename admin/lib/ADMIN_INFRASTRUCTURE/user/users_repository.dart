import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/src/injectable_annotations.dart';
import 'package:dartz/dartz.dart';

abstract class UsersRepository {
  Future<Unit> test();
}

@LazySingleton(as: UsersRepository, env: [Environment.dev, Environment.test, Environment.prod])
class UsersRepositoryFacade extends UsersRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  UsersRepositoryFacade(
    this._firestore,
    this._storage,
  );

  @override
  Future<Unit> test() async {
    print('hola');
    _firestore.collection('user').get().then((value) => value.docs.forEach((element) {
          print(element.data());
        }));
    return unit;
  }
}

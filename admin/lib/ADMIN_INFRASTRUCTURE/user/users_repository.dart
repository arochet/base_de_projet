import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/src/injectable_annotations.dart';
import 'package:dartz/dartz.dart';

abstract class UsersRepositoryI {
  Future<Unit> test();
}

@LazySingleton(as: UsersRepositoryI)
class UsersRepository extends UsersRepositoryI {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  UsersRepository(
    this._firestore,
    this._storage,
  );

  @override
  Future<Unit> test() async {
    _firestore.collection('users').get().then((value) => value.docs.forEach((element) {
          print(element.data());
        }));
    return unit;
  }
}

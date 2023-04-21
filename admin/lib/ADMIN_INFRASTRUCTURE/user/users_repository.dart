import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/src/injectable_annotations.dart';

@LazySingleton()
class FirebaseUserRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  FirebaseUserRepository(
    this._firestore,
    this._storage,
  );
}

import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:base_de_projet/domain/auth/user_auth.dart';
import 'package:base_de_projet/domain/core/value_objects.dart';

extension FirebaseUserDomainX on firebase.User {
  UserAuth toDomain() {
    return UserAuth(id: UniqueId.fromUniqueString(uid));
  }
}

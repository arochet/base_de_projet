import 'package:base_de_projet/infrastructure/auth/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:base_de_projet/domain/core/errors.dart';

import '../../injection.dart';

extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<AuthRepository>().getSignedUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError);
    return FirebaseFirestore.instance
        .collection('user')
        .doc(user.id.getOrCrash());
  }
}

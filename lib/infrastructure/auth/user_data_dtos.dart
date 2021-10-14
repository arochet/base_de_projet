import 'package:base_de_projet/domain/auth/user_data.dart';
import 'package:base_de_projet/domain/auth/value_objects.dart';
import 'package:base_de_projet/domain/core/value_objects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_data_dtos.freezed.dart';
part 'user_data_dtos.g.dart';

@freezed
abstract class UserDataDTO implements _$UserDataDTO {
  const UserDataDTO._();

  const factory UserDataDTO({
    @JsonKey(ignore: true) String? id,
    required String userName,
    required String email,
    required bool passwordCrypted,
  }) = _UserDataDTO;

  factory UserDataDTO.fromDomain(UserData user) {
    return UserDataDTO(
      userName: user.userName.getOrCrash(),
      email: user.email.getOrCrash(),
      passwordCrypted: user.passwordCrypted,
    );
  }

  UserData toDomain() {
    return UserData(
      id: UniqueId.fromUniqueString(id!),
      userName: Nom(userName),
      email: EmailAddress(email),
      passwordCrypted: passwordCrypted,
    );
  }

  factory UserDataDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDataDTOFromJson(json);

  factory UserDataDTO.fromFirestore(DocumentSnapshot doc) {
    return UserDataDTO.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }
}

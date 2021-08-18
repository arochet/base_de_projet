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
    required String firstName,
    required String name,
    required String userName,
    required String phone,
    required String email,
  }) = _UserDataDTO;

  factory UserDataDTO.fromDomain(UserData user) {
    return UserDataDTO(
      firstName: user.firstName.getOrCrash(),
      name: user.name.getOrCrash(),
      userName: user.userName.getOrCrash(),
      phone: user.phone.getOrCrash(),
      email: user.email.getOrCrash(),
    );
  }

  UserData toDomain() {
    return UserData(
      id: UniqueId.fromUniqueString(id!),
      firstName: Nom(firstName),
      name: Nom(name),
      userName: Nom(userName),
      phone: Telephone(phone),
      email: EmailAddress(email),
    );
  }

  factory UserDataDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDataDTOFromJson(json);

  factory UserDataDTO.fromFirestore(DocumentSnapshot doc) {
    return UserDataDTO.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }
}

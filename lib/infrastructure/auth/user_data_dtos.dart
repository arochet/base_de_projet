import 'package:base_de_projet/DOMAIN/auth/user_data.dart';
import 'package:base_de_projet/DOMAIN/auth/value_objects.dart';
import 'package:base_de_projet/DOMAIN/core/value_objects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_data_dtos.freezed.dart';
part 'user_data_dtos.g.dart';

/// <b>Fiche utilisateur</b><br>
/// DTO = Data Transfer Object<br>
/// On utilise les DTO pour communiquer avec Firestore<br>
/// On convertis ensuite UserDataDTO en UserData<br>
@freezed
abstract class UserDataDTO implements _$UserDataDTO {
  const UserDataDTO._();

  const factory UserDataDTO({
    @JsonKey(ignore: true) String? id,
    required String userName,
    required String? userNameLowerCase,
    required bool passwordCrypted,
    required String typeAccount,
  }) = _UserDataDTO;

  /// Convertit UserData en UserDataDTO<br>
  factory UserDataDTO.fromDomain(UserData user) {
    return UserDataDTO(
      userName: user.userName.getOrCrash(),
      userNameLowerCase: user.userName.getOrCrash().toLowerCase(),
      passwordCrypted: user.passwordCrypted,
      typeAccount: user.typeAccount.getOrCrash().toShortString(),
    );
  }

  /// Convertit UserDataDTO en UserData<br>
  UserData toDomain(String? _email) {
    return UserData(
      id: UniqueId.fromUniqueString(id!),
      userName: Nom(userName),
      email: _email != null ? EmailAddress(_email) : null,
      passwordCrypted: passwordCrypted,
      typeAccount: TypeAccount.fromString(typeAccount),
    );
  }

  /// Convertit un Json en UserDataDTO<br>
  factory UserDataDTO.fromJson(Map<String, dynamic> json) => _$UserDataDTOFromJson(json);

  /// Convertit un DocumentSnapshot de FireStore en UserDataDTO<br>
  factory UserDataDTO.fromFirestore(DocumentSnapshot doc) {
    return UserDataDTO.fromJson(doc.data() as Map<String, dynamic>).copyWith(id: doc.id);
  }
}

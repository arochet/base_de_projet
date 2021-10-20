import 'package:base_de_projet/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:base_de_projet/domain/core/value_objects.dart';

part 'user_data.freezed.dart';

@freezed
abstract class UserData with _$UserData {
  const UserData._();

  const factory UserData({
    required UniqueId id,
    required Nom userName,
    required EmailAddress email,
    required bool passwordCrypted,
    required TypeAccount typeAccount,
  }) = _UserData;

  factory UserData.empty() => UserData(
        id: UniqueId(),
        userName: Nom(''),
        email: EmailAddress(''),
        passwordCrypted: true,
        typeAccount: TypeAccount(TypeAccountState.email),
      );
}

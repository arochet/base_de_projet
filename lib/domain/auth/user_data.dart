import 'package:base_de_projet/DOMAIN/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:base_de_projet/DOMAIN/core/value_objects.dart';

part 'user_data.freezed.dart';

@freezed
abstract class UserData with _$UserData {
  const UserData._();

  const factory UserData({
    required UniqueId id,
    required Nom userName,
    required EmailAddress? email,
    required bool passwordCrypted,
    required TypeAccount typeAccount,
  }) = _UserData;

  factory UserData.empty() => UserData(
        id: UniqueId(),
        userName: Nom(''),
        email: null,
        passwordCrypted: true,
        typeAccount: TypeAccount(TypeAccountState.email),
      );

  static int get nbColumn => title.length;
  static List<String> get title => ['Nom', 'email', 'MDP Crypté', 'Type de\n compte'];
  fieldToString(int i) {
    switch (i) {
      case 0:
        return userName.getOrCrash();
      case 1:
        return email?.getOrCrash() ?? '';
      case 2:
        return passwordCrypted;
      case 3:
        return typeAccount.getOrCrash().toDisplayString();
      default:
        return 'Erreur';
    }
  }
}

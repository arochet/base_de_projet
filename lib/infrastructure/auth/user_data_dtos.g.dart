// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDataDTO _$_$_UserDataDTOFromJson(Map<String, dynamic> json) {
  return _$_UserDataDTO(
    userName: json['userName'] as String,
    email: json['email'] as String,
    passwordCrypted: json['passwordCrypted'] as bool,
  );
}

Map<String, dynamic> _$_$_UserDataDTOToJson(_$_UserDataDTO instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'passwordCrypted': instance.passwordCrypted,
    };

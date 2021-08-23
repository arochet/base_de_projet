// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDataDTO _$_$_UserDataDTOFromJson(Map<String, dynamic> json) {
  return _$_UserDataDTO(
    firstName: json['firstName'] as String,
    name: json['name'] as String,
    userName: json['userName'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
    passwordCrypted: json['passwordCrypted'] as bool,
  );
}

Map<String, dynamic> _$_$_UserDataDTOToJson(_$_UserDataDTO instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'name': instance.name,
      'userName': instance.userName,
      'phone': instance.phone,
      'email': instance.email,
      'passwordCrypted': instance.passwordCrypted,
    };

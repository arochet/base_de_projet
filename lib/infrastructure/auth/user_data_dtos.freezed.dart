// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_data_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDataDTO _$UserDataDTOFromJson(Map<String, dynamic> json) {
  return _UserDataDTO.fromJson(json);
}

/// @nodoc
class _$UserDataDTOTearOff {
  const _$UserDataDTOTearOff();

  _UserDataDTO call(
      {@JsonKey(ignore: true) String? id,
      required String firstName,
      required String name,
      required String userName,
      required String phone,
      required String email}) {
    return _UserDataDTO(
      id: id,
      firstName: firstName,
      name: name,
      userName: userName,
      phone: phone,
      email: email,
    );
  }

  UserDataDTO fromJson(Map<String, Object> json) {
    return UserDataDTO.fromJson(json);
  }
}

/// @nodoc
const $UserDataDTO = _$UserDataDTOTearOff();

/// @nodoc
mixin _$UserDataDTO {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataDTOCopyWith<UserDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataDTOCopyWith<$Res> {
  factory $UserDataDTOCopyWith(
          UserDataDTO value, $Res Function(UserDataDTO) then) =
      _$UserDataDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String firstName,
      String name,
      String userName,
      String phone,
      String email});
}

/// @nodoc
class _$UserDataDTOCopyWithImpl<$Res> implements $UserDataDTOCopyWith<$Res> {
  _$UserDataDTOCopyWithImpl(this._value, this._then);

  final UserDataDTO _value;
  // ignore: unused_field
  final $Res Function(UserDataDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? name = freezed,
    Object? userName = freezed,
    Object? phone = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserDataDTOCopyWith<$Res>
    implements $UserDataDTOCopyWith<$Res> {
  factory _$UserDataDTOCopyWith(
          _UserDataDTO value, $Res Function(_UserDataDTO) then) =
      __$UserDataDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String firstName,
      String name,
      String userName,
      String phone,
      String email});
}

/// @nodoc
class __$UserDataDTOCopyWithImpl<$Res> extends _$UserDataDTOCopyWithImpl<$Res>
    implements _$UserDataDTOCopyWith<$Res> {
  __$UserDataDTOCopyWithImpl(
      _UserDataDTO _value, $Res Function(_UserDataDTO) _then)
      : super(_value, (v) => _then(v as _UserDataDTO));

  @override
  _UserDataDTO get _value => super._value as _UserDataDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? name = freezed,
    Object? userName = freezed,
    Object? phone = freezed,
    Object? email = freezed,
  }) {
    return _then(_UserDataDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDataDTO extends _UserDataDTO {
  const _$_UserDataDTO(
      {@JsonKey(ignore: true) this.id,
      required this.firstName,
      required this.name,
      required this.userName,
      required this.phone,
      required this.email})
      : super._();

  factory _$_UserDataDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_UserDataDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String firstName;
  @override
  final String name;
  @override
  final String userName;
  @override
  final String phone;
  @override
  final String email;

  @override
  String toString() {
    return 'UserDataDTO(id: $id, firstName: $firstName, name: $name, userName: $userName, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserDataDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  _$UserDataDTOCopyWith<_UserDataDTO> get copyWith =>
      __$UserDataDTOCopyWithImpl<_UserDataDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserDataDTOToJson(this);
  }
}

abstract class _UserDataDTO extends UserDataDTO {
  const factory _UserDataDTO(
      {@JsonKey(ignore: true) String? id,
      required String firstName,
      required String name,
      required String userName,
      required String phone,
      required String email}) = _$_UserDataDTO;
  const _UserDataDTO._() : super._();

  factory _UserDataDTO.fromJson(Map<String, dynamic> json) =
      _$_UserDataDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  String get firstName => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get userName => throw _privateConstructorUsedError;
  @override
  String get phone => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserDataDTOCopyWith<_UserDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDataDTO _$UserDataDTOFromJson(Map<String, dynamic> json) {
  return _UserDataDTO.fromJson(json);
}

/// @nodoc
mixin _$UserDataDTO {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String? get userNameLowerCase => throw _privateConstructorUsedError;
  bool get passwordCrypted => throw _privateConstructorUsedError;
  String get typeAccount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataDTOCopyWith<UserDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataDTOCopyWith<$Res> {
  factory $UserDataDTOCopyWith(
          UserDataDTO value, $Res Function(UserDataDTO) then) =
      _$UserDataDTOCopyWithImpl<$Res, UserDataDTO>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String userName,
      String? userNameLowerCase,
      bool passwordCrypted,
      String typeAccount});
}

/// @nodoc
class _$UserDataDTOCopyWithImpl<$Res, $Val extends UserDataDTO>
    implements $UserDataDTOCopyWith<$Res> {
  _$UserDataDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userName = null,
    Object? userNameLowerCase = freezed,
    Object? passwordCrypted = null,
    Object? typeAccount = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userNameLowerCase: freezed == userNameLowerCase
          ? _value.userNameLowerCase
          : userNameLowerCase // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordCrypted: null == passwordCrypted
          ? _value.passwordCrypted
          : passwordCrypted // ignore: cast_nullable_to_non_nullable
              as bool,
      typeAccount: null == typeAccount
          ? _value.typeAccount
          : typeAccount // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataDTOImplCopyWith<$Res>
    implements $UserDataDTOCopyWith<$Res> {
  factory _$$UserDataDTOImplCopyWith(
          _$UserDataDTOImpl value, $Res Function(_$UserDataDTOImpl) then) =
      __$$UserDataDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String userName,
      String? userNameLowerCase,
      bool passwordCrypted,
      String typeAccount});
}

/// @nodoc
class __$$UserDataDTOImplCopyWithImpl<$Res>
    extends _$UserDataDTOCopyWithImpl<$Res, _$UserDataDTOImpl>
    implements _$$UserDataDTOImplCopyWith<$Res> {
  __$$UserDataDTOImplCopyWithImpl(
      _$UserDataDTOImpl _value, $Res Function(_$UserDataDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userName = null,
    Object? userNameLowerCase = freezed,
    Object? passwordCrypted = null,
    Object? typeAccount = null,
  }) {
    return _then(_$UserDataDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userNameLowerCase: freezed == userNameLowerCase
          ? _value.userNameLowerCase
          : userNameLowerCase // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordCrypted: null == passwordCrypted
          ? _value.passwordCrypted
          : passwordCrypted // ignore: cast_nullable_to_non_nullable
              as bool,
      typeAccount: null == typeAccount
          ? _value.typeAccount
          : typeAccount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataDTOImpl extends _UserDataDTO {
  const _$UserDataDTOImpl(
      {@JsonKey(ignore: true) this.id,
      required this.userName,
      required this.userNameLowerCase,
      required this.passwordCrypted,
      required this.typeAccount})
      : super._();

  factory _$UserDataDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataDTOImplFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String userName;
  @override
  final String? userNameLowerCase;
  @override
  final bool passwordCrypted;
  @override
  final String typeAccount;

  @override
  String toString() {
    return 'UserDataDTO(id: $id, userName: $userName, userNameLowerCase: $userNameLowerCase, passwordCrypted: $passwordCrypted, typeAccount: $typeAccount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userNameLowerCase, userNameLowerCase) ||
                other.userNameLowerCase == userNameLowerCase) &&
            (identical(other.passwordCrypted, passwordCrypted) ||
                other.passwordCrypted == passwordCrypted) &&
            (identical(other.typeAccount, typeAccount) ||
                other.typeAccount == typeAccount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userName, userNameLowerCase,
      passwordCrypted, typeAccount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataDTOImplCopyWith<_$UserDataDTOImpl> get copyWith =>
      __$$UserDataDTOImplCopyWithImpl<_$UserDataDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataDTOImplToJson(
      this,
    );
  }
}

abstract class _UserDataDTO extends UserDataDTO {
  const factory _UserDataDTO(
      {@JsonKey(ignore: true) final String? id,
      required final String userName,
      required final String? userNameLowerCase,
      required final bool passwordCrypted,
      required final String typeAccount}) = _$UserDataDTOImpl;
  const _UserDataDTO._() : super._();

  factory _UserDataDTO.fromJson(Map<String, dynamic> json) =
      _$UserDataDTOImpl.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  String get userName;
  @override
  String? get userNameLowerCase;
  @override
  bool get passwordCrypted;
  @override
  String get typeAccount;
  @override
  @JsonKey(ignore: true)
  _$$UserDataDTOImplCopyWith<_$UserDataDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

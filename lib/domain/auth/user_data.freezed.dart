// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserData {
  UniqueId get id => throw _privateConstructorUsedError;
  Nom get userName => throw _privateConstructorUsedError;
  EmailAddress? get email => throw _privateConstructorUsedError;
  bool get passwordCrypted => throw _privateConstructorUsedError;
  TypeAccount get typeAccount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      Nom userName,
      EmailAddress? email,
      bool passwordCrypted,
      TypeAccount typeAccount});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res> implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  final UserData _value;
  // ignore: unused_field
  final $Res Function(UserData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? email = freezed,
    Object? passwordCrypted = freezed,
    Object? typeAccount = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as Nom,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress?,
      passwordCrypted: passwordCrypted == freezed
          ? _value.passwordCrypted
          : passwordCrypted // ignore: cast_nullable_to_non_nullable
              as bool,
      typeAccount: typeAccount == freezed
          ? _value.typeAccount
          : typeAccount // ignore: cast_nullable_to_non_nullable
              as TypeAccount,
    ));
  }
}

/// @nodoc
abstract class _$$_UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$$_UserDataCopyWith(
          _$_UserData value, $Res Function(_$_UserData) then) =
      __$$_UserDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      Nom userName,
      EmailAddress? email,
      bool passwordCrypted,
      TypeAccount typeAccount});
}

/// @nodoc
class __$$_UserDataCopyWithImpl<$Res> extends _$UserDataCopyWithImpl<$Res>
    implements _$$_UserDataCopyWith<$Res> {
  __$$_UserDataCopyWithImpl(
      _$_UserData _value, $Res Function(_$_UserData) _then)
      : super(_value, (v) => _then(v as _$_UserData));

  @override
  _$_UserData get _value => super._value as _$_UserData;

  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? email = freezed,
    Object? passwordCrypted = freezed,
    Object? typeAccount = freezed,
  }) {
    return _then(_$_UserData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as Nom,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress?,
      passwordCrypted: passwordCrypted == freezed
          ? _value.passwordCrypted
          : passwordCrypted // ignore: cast_nullable_to_non_nullable
              as bool,
      typeAccount: typeAccount == freezed
          ? _value.typeAccount
          : typeAccount // ignore: cast_nullable_to_non_nullable
              as TypeAccount,
    ));
  }
}

/// @nodoc

class _$_UserData extends _UserData {
  const _$_UserData(
      {required this.id,
      required this.userName,
      required this.email,
      required this.passwordCrypted,
      required this.typeAccount})
      : super._();

  @override
  final UniqueId id;
  @override
  final Nom userName;
  @override
  final EmailAddress? email;
  @override
  final bool passwordCrypted;
  @override
  final TypeAccount typeAccount;

  @override
  String toString() {
    return 'UserData(id: $id, userName: $userName, email: $email, passwordCrypted: $passwordCrypted, typeAccount: $typeAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserData &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.passwordCrypted, passwordCrypted) &&
            const DeepCollectionEquality()
                .equals(other.typeAccount, typeAccount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(passwordCrypted),
      const DeepCollectionEquality().hash(typeAccount));

  @JsonKey(ignore: true)
  @override
  _$$_UserDataCopyWith<_$_UserData> get copyWith =>
      __$$_UserDataCopyWithImpl<_$_UserData>(this, _$identity);
}

abstract class _UserData extends UserData {
  const factory _UserData(
      {required final UniqueId id,
      required final Nom userName,
      required final EmailAddress? email,
      required final bool passwordCrypted,
      required final TypeAccount typeAccount}) = _$_UserData;
  const _UserData._() : super._();

  @override
  UniqueId get id;
  @override
  Nom get userName;
  @override
  EmailAddress? get email;
  @override
  bool get passwordCrypted;
  @override
  TypeAccount get typeAccount;
  @override
  @JsonKey(ignore: true)
  _$$_UserDataCopyWith<_$_UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

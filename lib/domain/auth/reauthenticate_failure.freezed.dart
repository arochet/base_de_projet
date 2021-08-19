// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'reauthenticate_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ReauthenticateFailureTearOff {
  const _$ReauthenticateFailureTearOff();

  ServerError serverError() {
    return const ServerError();
  }

  NotAuthenticated notAuthenticated() {
    return const NotAuthenticated();
  }

  UserMismatch userMismatch() {
    return const UserMismatch();
  }

  UserNotFound userNotFound() {
    return const UserNotFound();
  }

  InvalidCredential invalidCredential() {
    return const InvalidCredential();
  }

  InvalidEmail invalidEmail() {
    return const InvalidEmail();
  }

  WrongPassword wrongPassword() {
    return const WrongPassword();
  }

  TooManyRequest tooManyRequest() {
    return const TooManyRequest();
  }
}

/// @nodoc
const $ReauthenticateFailure = _$ReauthenticateFailureTearOff();

/// @nodoc
mixin _$ReauthenticateFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() notAuthenticated,
    required TResult Function() userMismatch,
    required TResult Function() userNotFound,
    required TResult Function() invalidCredential,
    required TResult Function() invalidEmail,
    required TResult Function() wrongPassword,
    required TResult Function() tooManyRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? notAuthenticated,
    TResult Function()? userMismatch,
    TResult Function()? userNotFound,
    TResult Function()? invalidCredential,
    TResult Function()? invalidEmail,
    TResult Function()? wrongPassword,
    TResult Function()? tooManyRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NotAuthenticated value) notAuthenticated,
    required TResult Function(UserMismatch value) userMismatch,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(InvalidCredential value) invalidCredential,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(TooManyRequest value) tooManyRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NotAuthenticated value)? notAuthenticated,
    TResult Function(UserMismatch value)? userMismatch,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(InvalidCredential value)? invalidCredential,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(TooManyRequest value)? tooManyRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReauthenticateFailureCopyWith<$Res> {
  factory $ReauthenticateFailureCopyWith(ReauthenticateFailure value,
          $Res Function(ReauthenticateFailure) then) =
      _$ReauthenticateFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReauthenticateFailureCopyWithImpl<$Res>
    implements $ReauthenticateFailureCopyWith<$Res> {
  _$ReauthenticateFailureCopyWithImpl(this._value, this._then);

  final ReauthenticateFailure _value;
  // ignore: unused_field
  final $Res Function(ReauthenticateFailure) _then;
}

/// @nodoc
abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServerErrorCopyWithImpl<$Res>
    extends _$ReauthenticateFailureCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(
      ServerError _value, $Res Function(ServerError) _then)
      : super(_value, (v) => _then(v as ServerError));

  @override
  ServerError get _value => super._value as ServerError;
}

/// @nodoc

class _$ServerError implements ServerError {
  const _$ServerError();

  @override
  String toString() {
    return 'ReauthenticateFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() notAuthenticated,
    required TResult Function() userMismatch,
    required TResult Function() userNotFound,
    required TResult Function() invalidCredential,
    required TResult Function() invalidEmail,
    required TResult Function() wrongPassword,
    required TResult Function() tooManyRequest,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? notAuthenticated,
    TResult Function()? userMismatch,
    TResult Function()? userNotFound,
    TResult Function()? invalidCredential,
    TResult Function()? invalidEmail,
    TResult Function()? wrongPassword,
    TResult Function()? tooManyRequest,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NotAuthenticated value) notAuthenticated,
    required TResult Function(UserMismatch value) userMismatch,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(InvalidCredential value) invalidCredential,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(TooManyRequest value) tooManyRequest,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NotAuthenticated value)? notAuthenticated,
    TResult Function(UserMismatch value)? userMismatch,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(InvalidCredential value)? invalidCredential,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(TooManyRequest value)? tooManyRequest,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements ReauthenticateFailure {
  const factory ServerError() = _$ServerError;
}

/// @nodoc
abstract class $NotAuthenticatedCopyWith<$Res> {
  factory $NotAuthenticatedCopyWith(
          NotAuthenticated value, $Res Function(NotAuthenticated) then) =
      _$NotAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotAuthenticatedCopyWithImpl<$Res>
    extends _$ReauthenticateFailureCopyWithImpl<$Res>
    implements $NotAuthenticatedCopyWith<$Res> {
  _$NotAuthenticatedCopyWithImpl(
      NotAuthenticated _value, $Res Function(NotAuthenticated) _then)
      : super(_value, (v) => _then(v as NotAuthenticated));

  @override
  NotAuthenticated get _value => super._value as NotAuthenticated;
}

/// @nodoc

class _$NotAuthenticated implements NotAuthenticated {
  const _$NotAuthenticated();

  @override
  String toString() {
    return 'ReauthenticateFailure.notAuthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NotAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() notAuthenticated,
    required TResult Function() userMismatch,
    required TResult Function() userNotFound,
    required TResult Function() invalidCredential,
    required TResult Function() invalidEmail,
    required TResult Function() wrongPassword,
    required TResult Function() tooManyRequest,
  }) {
    return notAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? notAuthenticated,
    TResult Function()? userMismatch,
    TResult Function()? userNotFound,
    TResult Function()? invalidCredential,
    TResult Function()? invalidEmail,
    TResult Function()? wrongPassword,
    TResult Function()? tooManyRequest,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NotAuthenticated value) notAuthenticated,
    required TResult Function(UserMismatch value) userMismatch,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(InvalidCredential value) invalidCredential,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(TooManyRequest value) tooManyRequest,
  }) {
    return notAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NotAuthenticated value)? notAuthenticated,
    TResult Function(UserMismatch value)? userMismatch,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(InvalidCredential value)? invalidCredential,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(TooManyRequest value)? tooManyRequest,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated(this);
    }
    return orElse();
  }
}

abstract class NotAuthenticated implements ReauthenticateFailure {
  const factory NotAuthenticated() = _$NotAuthenticated;
}

/// @nodoc
abstract class $UserMismatchCopyWith<$Res> {
  factory $UserMismatchCopyWith(
          UserMismatch value, $Res Function(UserMismatch) then) =
      _$UserMismatchCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserMismatchCopyWithImpl<$Res>
    extends _$ReauthenticateFailureCopyWithImpl<$Res>
    implements $UserMismatchCopyWith<$Res> {
  _$UserMismatchCopyWithImpl(
      UserMismatch _value, $Res Function(UserMismatch) _then)
      : super(_value, (v) => _then(v as UserMismatch));

  @override
  UserMismatch get _value => super._value as UserMismatch;
}

/// @nodoc

class _$UserMismatch implements UserMismatch {
  const _$UserMismatch();

  @override
  String toString() {
    return 'ReauthenticateFailure.userMismatch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UserMismatch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() notAuthenticated,
    required TResult Function() userMismatch,
    required TResult Function() userNotFound,
    required TResult Function() invalidCredential,
    required TResult Function() invalidEmail,
    required TResult Function() wrongPassword,
    required TResult Function() tooManyRequest,
  }) {
    return userMismatch();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? notAuthenticated,
    TResult Function()? userMismatch,
    TResult Function()? userNotFound,
    TResult Function()? invalidCredential,
    TResult Function()? invalidEmail,
    TResult Function()? wrongPassword,
    TResult Function()? tooManyRequest,
    required TResult orElse(),
  }) {
    if (userMismatch != null) {
      return userMismatch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NotAuthenticated value) notAuthenticated,
    required TResult Function(UserMismatch value) userMismatch,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(InvalidCredential value) invalidCredential,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(TooManyRequest value) tooManyRequest,
  }) {
    return userMismatch(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NotAuthenticated value)? notAuthenticated,
    TResult Function(UserMismatch value)? userMismatch,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(InvalidCredential value)? invalidCredential,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(TooManyRequest value)? tooManyRequest,
    required TResult orElse(),
  }) {
    if (userMismatch != null) {
      return userMismatch(this);
    }
    return orElse();
  }
}

abstract class UserMismatch implements ReauthenticateFailure {
  const factory UserMismatch() = _$UserMismatch;
}

/// @nodoc
abstract class $UserNotFoundCopyWith<$Res> {
  factory $UserNotFoundCopyWith(
          UserNotFound value, $Res Function(UserNotFound) then) =
      _$UserNotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserNotFoundCopyWithImpl<$Res>
    extends _$ReauthenticateFailureCopyWithImpl<$Res>
    implements $UserNotFoundCopyWith<$Res> {
  _$UserNotFoundCopyWithImpl(
      UserNotFound _value, $Res Function(UserNotFound) _then)
      : super(_value, (v) => _then(v as UserNotFound));

  @override
  UserNotFound get _value => super._value as UserNotFound;
}

/// @nodoc

class _$UserNotFound implements UserNotFound {
  const _$UserNotFound();

  @override
  String toString() {
    return 'ReauthenticateFailure.userNotFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UserNotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() notAuthenticated,
    required TResult Function() userMismatch,
    required TResult Function() userNotFound,
    required TResult Function() invalidCredential,
    required TResult Function() invalidEmail,
    required TResult Function() wrongPassword,
    required TResult Function() tooManyRequest,
  }) {
    return userNotFound();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? notAuthenticated,
    TResult Function()? userMismatch,
    TResult Function()? userNotFound,
    TResult Function()? invalidCredential,
    TResult Function()? invalidEmail,
    TResult Function()? wrongPassword,
    TResult Function()? tooManyRequest,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NotAuthenticated value) notAuthenticated,
    required TResult Function(UserMismatch value) userMismatch,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(InvalidCredential value) invalidCredential,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(TooManyRequest value) tooManyRequest,
  }) {
    return userNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NotAuthenticated value)? notAuthenticated,
    TResult Function(UserMismatch value)? userMismatch,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(InvalidCredential value)? invalidCredential,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(TooManyRequest value)? tooManyRequest,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound(this);
    }
    return orElse();
  }
}

abstract class UserNotFound implements ReauthenticateFailure {
  const factory UserNotFound() = _$UserNotFound;
}

/// @nodoc
abstract class $InvalidCredentialCopyWith<$Res> {
  factory $InvalidCredentialCopyWith(
          InvalidCredential value, $Res Function(InvalidCredential) then) =
      _$InvalidCredentialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InvalidCredentialCopyWithImpl<$Res>
    extends _$ReauthenticateFailureCopyWithImpl<$Res>
    implements $InvalidCredentialCopyWith<$Res> {
  _$InvalidCredentialCopyWithImpl(
      InvalidCredential _value, $Res Function(InvalidCredential) _then)
      : super(_value, (v) => _then(v as InvalidCredential));

  @override
  InvalidCredential get _value => super._value as InvalidCredential;
}

/// @nodoc

class _$InvalidCredential implements InvalidCredential {
  const _$InvalidCredential();

  @override
  String toString() {
    return 'ReauthenticateFailure.invalidCredential()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidCredential);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() notAuthenticated,
    required TResult Function() userMismatch,
    required TResult Function() userNotFound,
    required TResult Function() invalidCredential,
    required TResult Function() invalidEmail,
    required TResult Function() wrongPassword,
    required TResult Function() tooManyRequest,
  }) {
    return invalidCredential();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? notAuthenticated,
    TResult Function()? userMismatch,
    TResult Function()? userNotFound,
    TResult Function()? invalidCredential,
    TResult Function()? invalidEmail,
    TResult Function()? wrongPassword,
    TResult Function()? tooManyRequest,
    required TResult orElse(),
  }) {
    if (invalidCredential != null) {
      return invalidCredential();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NotAuthenticated value) notAuthenticated,
    required TResult Function(UserMismatch value) userMismatch,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(InvalidCredential value) invalidCredential,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(TooManyRequest value) tooManyRequest,
  }) {
    return invalidCredential(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NotAuthenticated value)? notAuthenticated,
    TResult Function(UserMismatch value)? userMismatch,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(InvalidCredential value)? invalidCredential,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(TooManyRequest value)? tooManyRequest,
    required TResult orElse(),
  }) {
    if (invalidCredential != null) {
      return invalidCredential(this);
    }
    return orElse();
  }
}

abstract class InvalidCredential implements ReauthenticateFailure {
  const factory InvalidCredential() = _$InvalidCredential;
}

/// @nodoc
abstract class $InvalidEmailCopyWith<$Res> {
  factory $InvalidEmailCopyWith(
          InvalidEmail value, $Res Function(InvalidEmail) then) =
      _$InvalidEmailCopyWithImpl<$Res>;
}

/// @nodoc
class _$InvalidEmailCopyWithImpl<$Res>
    extends _$ReauthenticateFailureCopyWithImpl<$Res>
    implements $InvalidEmailCopyWith<$Res> {
  _$InvalidEmailCopyWithImpl(
      InvalidEmail _value, $Res Function(InvalidEmail) _then)
      : super(_value, (v) => _then(v as InvalidEmail));

  @override
  InvalidEmail get _value => super._value as InvalidEmail;
}

/// @nodoc

class _$InvalidEmail implements InvalidEmail {
  const _$InvalidEmail();

  @override
  String toString() {
    return 'ReauthenticateFailure.invalidEmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() notAuthenticated,
    required TResult Function() userMismatch,
    required TResult Function() userNotFound,
    required TResult Function() invalidCredential,
    required TResult Function() invalidEmail,
    required TResult Function() wrongPassword,
    required TResult Function() tooManyRequest,
  }) {
    return invalidEmail();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? notAuthenticated,
    TResult Function()? userMismatch,
    TResult Function()? userNotFound,
    TResult Function()? invalidCredential,
    TResult Function()? invalidEmail,
    TResult Function()? wrongPassword,
    TResult Function()? tooManyRequest,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NotAuthenticated value) notAuthenticated,
    required TResult Function(UserMismatch value) userMismatch,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(InvalidCredential value) invalidCredential,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(TooManyRequest value) tooManyRequest,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NotAuthenticated value)? notAuthenticated,
    TResult Function(UserMismatch value)? userMismatch,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(InvalidCredential value)? invalidCredential,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(TooManyRequest value)? tooManyRequest,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail implements ReauthenticateFailure {
  const factory InvalidEmail() = _$InvalidEmail;
}

/// @nodoc
abstract class $WrongPasswordCopyWith<$Res> {
  factory $WrongPasswordCopyWith(
          WrongPassword value, $Res Function(WrongPassword) then) =
      _$WrongPasswordCopyWithImpl<$Res>;
}

/// @nodoc
class _$WrongPasswordCopyWithImpl<$Res>
    extends _$ReauthenticateFailureCopyWithImpl<$Res>
    implements $WrongPasswordCopyWith<$Res> {
  _$WrongPasswordCopyWithImpl(
      WrongPassword _value, $Res Function(WrongPassword) _then)
      : super(_value, (v) => _then(v as WrongPassword));

  @override
  WrongPassword get _value => super._value as WrongPassword;
}

/// @nodoc

class _$WrongPassword implements WrongPassword {
  const _$WrongPassword();

  @override
  String toString() {
    return 'ReauthenticateFailure.wrongPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is WrongPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() notAuthenticated,
    required TResult Function() userMismatch,
    required TResult Function() userNotFound,
    required TResult Function() invalidCredential,
    required TResult Function() invalidEmail,
    required TResult Function() wrongPassword,
    required TResult Function() tooManyRequest,
  }) {
    return wrongPassword();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? notAuthenticated,
    TResult Function()? userMismatch,
    TResult Function()? userNotFound,
    TResult Function()? invalidCredential,
    TResult Function()? invalidEmail,
    TResult Function()? wrongPassword,
    TResult Function()? tooManyRequest,
    required TResult orElse(),
  }) {
    if (wrongPassword != null) {
      return wrongPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NotAuthenticated value) notAuthenticated,
    required TResult Function(UserMismatch value) userMismatch,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(InvalidCredential value) invalidCredential,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(TooManyRequest value) tooManyRequest,
  }) {
    return wrongPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NotAuthenticated value)? notAuthenticated,
    TResult Function(UserMismatch value)? userMismatch,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(InvalidCredential value)? invalidCredential,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(TooManyRequest value)? tooManyRequest,
    required TResult orElse(),
  }) {
    if (wrongPassword != null) {
      return wrongPassword(this);
    }
    return orElse();
  }
}

abstract class WrongPassword implements ReauthenticateFailure {
  const factory WrongPassword() = _$WrongPassword;
}

/// @nodoc
abstract class $TooManyRequestCopyWith<$Res> {
  factory $TooManyRequestCopyWith(
          TooManyRequest value, $Res Function(TooManyRequest) then) =
      _$TooManyRequestCopyWithImpl<$Res>;
}

/// @nodoc
class _$TooManyRequestCopyWithImpl<$Res>
    extends _$ReauthenticateFailureCopyWithImpl<$Res>
    implements $TooManyRequestCopyWith<$Res> {
  _$TooManyRequestCopyWithImpl(
      TooManyRequest _value, $Res Function(TooManyRequest) _then)
      : super(_value, (v) => _then(v as TooManyRequest));

  @override
  TooManyRequest get _value => super._value as TooManyRequest;
}

/// @nodoc

class _$TooManyRequest implements TooManyRequest {
  const _$TooManyRequest();

  @override
  String toString() {
    return 'ReauthenticateFailure.tooManyRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is TooManyRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() notAuthenticated,
    required TResult Function() userMismatch,
    required TResult Function() userNotFound,
    required TResult Function() invalidCredential,
    required TResult Function() invalidEmail,
    required TResult Function() wrongPassword,
    required TResult Function() tooManyRequest,
  }) {
    return tooManyRequest();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? notAuthenticated,
    TResult Function()? userMismatch,
    TResult Function()? userNotFound,
    TResult Function()? invalidCredential,
    TResult Function()? invalidEmail,
    TResult Function()? wrongPassword,
    TResult Function()? tooManyRequest,
    required TResult orElse(),
  }) {
    if (tooManyRequest != null) {
      return tooManyRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NotAuthenticated value) notAuthenticated,
    required TResult Function(UserMismatch value) userMismatch,
    required TResult Function(UserNotFound value) userNotFound,
    required TResult Function(InvalidCredential value) invalidCredential,
    required TResult Function(InvalidEmail value) invalidEmail,
    required TResult Function(WrongPassword value) wrongPassword,
    required TResult Function(TooManyRequest value) tooManyRequest,
  }) {
    return tooManyRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NotAuthenticated value)? notAuthenticated,
    TResult Function(UserMismatch value)? userMismatch,
    TResult Function(UserNotFound value)? userNotFound,
    TResult Function(InvalidCredential value)? invalidCredential,
    TResult Function(InvalidEmail value)? invalidEmail,
    TResult Function(WrongPassword value)? wrongPassword,
    TResult Function(TooManyRequest value)? tooManyRequest,
    required TResult orElse(),
  }) {
    if (tooManyRequest != null) {
      return tooManyRequest(this);
    }
    return orElse();
  }
}

abstract class TooManyRequest implements ReauthenticateFailure {
  const factory TooManyRequest() = _$TooManyRequest;
}

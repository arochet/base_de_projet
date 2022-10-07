// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterFormData {
  Nom get nomUtilisateur => throw _privateConstructorUsedError;
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  PasswordConfirmation get passwordConfirmation =>
      throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterFormDataCopyWith<RegisterFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterFormDataCopyWith<$Res> {
  factory $RegisterFormDataCopyWith(
          RegisterFormData value, $Res Function(RegisterFormData) then) =
      _$RegisterFormDataCopyWithImpl<$Res>;
  $Res call(
      {Nom nomUtilisateur,
      EmailAddress emailAddress,
      Password password,
      PasswordConfirmation passwordConfirmation,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$RegisterFormDataCopyWithImpl<$Res>
    implements $RegisterFormDataCopyWith<$Res> {
  _$RegisterFormDataCopyWithImpl(this._value, this._then);

  final RegisterFormData _value;
  // ignore: unused_field
  final $Res Function(RegisterFormData) _then;

  @override
  $Res call({
    Object? nomUtilisateur = freezed,
    Object? emailAddress = freezed,
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      nomUtilisateur: nomUtilisateur == freezed
          ? _value.nomUtilisateur
          : nomUtilisateur // ignore: cast_nullable_to_non_nullable
              as Nom,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      passwordConfirmation: passwordConfirmation == freezed
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as PasswordConfirmation,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$$_RegisterFormDataCopyWith<$Res>
    implements $RegisterFormDataCopyWith<$Res> {
  factory _$$_RegisterFormDataCopyWith(
          _$_RegisterFormData value, $Res Function(_$_RegisterFormData) then) =
      __$$_RegisterFormDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {Nom nomUtilisateur,
      EmailAddress emailAddress,
      Password password,
      PasswordConfirmation passwordConfirmation,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$$_RegisterFormDataCopyWithImpl<$Res>
    extends _$RegisterFormDataCopyWithImpl<$Res>
    implements _$$_RegisterFormDataCopyWith<$Res> {
  __$$_RegisterFormDataCopyWithImpl(
      _$_RegisterFormData _value, $Res Function(_$_RegisterFormData) _then)
      : super(_value, (v) => _then(v as _$_RegisterFormData));

  @override
  _$_RegisterFormData get _value => super._value as _$_RegisterFormData;

  @override
  $Res call({
    Object? nomUtilisateur = freezed,
    Object? emailAddress = freezed,
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_RegisterFormData(
      nomUtilisateur: nomUtilisateur == freezed
          ? _value.nomUtilisateur
          : nomUtilisateur // ignore: cast_nullable_to_non_nullable
              as Nom,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      passwordConfirmation: passwordConfirmation == freezed
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as PasswordConfirmation,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_RegisterFormData implements _RegisterFormData {
  const _$_RegisterFormData(
      {required this.nomUtilisateur,
      required this.emailAddress,
      required this.password,
      required this.passwordConfirmation,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final Nom nomUtilisateur;
  @override
  final EmailAddress emailAddress;
  @override
  final Password password;
  @override
  final PasswordConfirmation passwordConfirmation;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'RegisterFormData(nomUtilisateur: $nomUtilisateur, emailAddress: $emailAddress, password: $password, passwordConfirmation: $passwordConfirmation, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterFormData &&
            const DeepCollectionEquality()
                .equals(other.nomUtilisateur, nomUtilisateur) &&
            const DeepCollectionEquality()
                .equals(other.emailAddress, emailAddress) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.passwordConfirmation, passwordConfirmation) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality().equals(
                other.authFailureOrSuccessOption, authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nomUtilisateur),
      const DeepCollectionEquality().hash(emailAddress),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(passwordConfirmation),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(authFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_RegisterFormDataCopyWith<_$_RegisterFormData> get copyWith =>
      __$$_RegisterFormDataCopyWithImpl<_$_RegisterFormData>(this, _$identity);
}

abstract class _RegisterFormData implements RegisterFormData {
  const factory _RegisterFormData(
      {required final Nom nomUtilisateur,
      required final EmailAddress emailAddress,
      required final Password password,
      required final PasswordConfirmation passwordConfirmation,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<AuthFailure, Unit>>
          authFailureOrSuccessOption}) = _$_RegisterFormData;

  @override
  Nom get nomUtilisateur;
  @override
  EmailAddress get emailAddress;
  @override
  Password get password;
  @override
  PasswordConfirmation get passwordConfirmation;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterFormDataCopyWith<_$_RegisterFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

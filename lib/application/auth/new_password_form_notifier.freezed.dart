// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of '../account/new_password_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NewPasswordFormDataTearOff {
  const _$NewPasswordFormDataTearOff();

  _NewPasswordFormData call(
      {required Password password,
      required PasswordConfirmation passwordConfirmation,
      required bool showErrorMessages,
      required bool isSubmitting,
      required Option<Either<NewPasswordFailure, Unit>>
          authFailureOrSuccessOption}) {
    return _NewPasswordFormData(
      password: password,
      passwordConfirmation: passwordConfirmation,
      showErrorMessages: showErrorMessages,
      isSubmitting: isSubmitting,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $NewPasswordFormData = _$NewPasswordFormDataTearOff();

/// @nodoc
mixin _$NewPasswordFormData {
  Password get password => throw _privateConstructorUsedError;
  PasswordConfirmation get passwordConfirmation =>
      throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<NewPasswordFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewPasswordFormDataCopyWith<NewPasswordFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPasswordFormDataCopyWith<$Res> {
  factory $NewPasswordFormDataCopyWith(
          NewPasswordFormData value, $Res Function(NewPasswordFormData) then) =
      _$NewPasswordFormDataCopyWithImpl<$Res>;
  $Res call(
      {Password password,
      PasswordConfirmation passwordConfirmation,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<NewPasswordFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$NewPasswordFormDataCopyWithImpl<$Res>
    implements $NewPasswordFormDataCopyWith<$Res> {
  _$NewPasswordFormDataCopyWithImpl(this._value, this._then);

  final NewPasswordFormData _value;
  // ignore: unused_field
  final $Res Function(NewPasswordFormData) _then;

  @override
  $Res call({
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
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
              as Option<Either<NewPasswordFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$NewPasswordFormDataCopyWith<$Res>
    implements $NewPasswordFormDataCopyWith<$Res> {
  factory _$NewPasswordFormDataCopyWith(_NewPasswordFormData value,
          $Res Function(_NewPasswordFormData) then) =
      __$NewPasswordFormDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {Password password,
      PasswordConfirmation passwordConfirmation,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<NewPasswordFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$NewPasswordFormDataCopyWithImpl<$Res>
    extends _$NewPasswordFormDataCopyWithImpl<$Res>
    implements _$NewPasswordFormDataCopyWith<$Res> {
  __$NewPasswordFormDataCopyWithImpl(
      _NewPasswordFormData _value, $Res Function(_NewPasswordFormData) _then)
      : super(_value, (v) => _then(v as _NewPasswordFormData));

  @override
  _NewPasswordFormData get _value => super._value as _NewPasswordFormData;

  @override
  $Res call({
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_NewPasswordFormData(
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
              as Option<Either<NewPasswordFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_NewPasswordFormData implements _NewPasswordFormData {
  const _$_NewPasswordFormData(
      {required this.password,
      required this.passwordConfirmation,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final Password password;
  @override
  final PasswordConfirmation passwordConfirmation;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<NewPasswordFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'NewPasswordFormData(password: $password, passwordConfirmation: $passwordConfirmation, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NewPasswordFormData &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                const DeepCollectionEquality().equals(
                    other.passwordConfirmation, passwordConfirmation)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(passwordConfirmation) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  _$NewPasswordFormDataCopyWith<_NewPasswordFormData> get copyWith =>
      __$NewPasswordFormDataCopyWithImpl<_NewPasswordFormData>(
          this, _$identity);
}

abstract class _NewPasswordFormData implements NewPasswordFormData {
  const factory _NewPasswordFormData(
      {required Password password,
      required PasswordConfirmation passwordConfirmation,
      required bool showErrorMessages,
      required bool isSubmitting,
      required Option<Either<NewPasswordFailure, Unit>>
          authFailureOrSuccessOption}) = _$_NewPasswordFormData;

  @override
  Password get password => throw _privateConstructorUsedError;
  @override
  PasswordConfirmation get passwordConfirmation =>
      throw _privateConstructorUsedError;
  @override
  bool get showErrorMessages => throw _privateConstructorUsedError;
  @override
  bool get isSubmitting => throw _privateConstructorUsedError;
  @override
  Option<Either<NewPasswordFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NewPasswordFormDataCopyWith<_NewPasswordFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reset_password_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ResetPasswordFormDataTearOff {
  const _$ResetPasswordFormDataTearOff();

  _ResetPasswordFormData call(
      {required EmailAddress emailAddress,
      required bool showErrorMessages,
      required bool isSubmitting,
      required Option<Either<ResetPasswordFailure, Unit>>
          authFailureOrSuccessOption}) {
    return _ResetPasswordFormData(
      emailAddress: emailAddress,
      showErrorMessages: showErrorMessages,
      isSubmitting: isSubmitting,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $ResetPasswordFormData = _$ResetPasswordFormDataTearOff();

/// @nodoc
mixin _$ResetPasswordFormData {
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<ResetPasswordFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordFormDataCopyWith<ResetPasswordFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordFormDataCopyWith<$Res> {
  factory $ResetPasswordFormDataCopyWith(ResetPasswordFormData value,
          $Res Function(ResetPasswordFormData) then) =
      _$ResetPasswordFormDataCopyWithImpl<$Res>;
  $Res call(
      {EmailAddress emailAddress,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ResetPasswordFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$ResetPasswordFormDataCopyWithImpl<$Res>
    implements $ResetPasswordFormDataCopyWith<$Res> {
  _$ResetPasswordFormDataCopyWithImpl(this._value, this._then);

  final ResetPasswordFormData _value;
  // ignore: unused_field
  final $Res Function(ResetPasswordFormData) _then;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
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
              as Option<Either<ResetPasswordFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$ResetPasswordFormDataCopyWith<$Res>
    implements $ResetPasswordFormDataCopyWith<$Res> {
  factory _$ResetPasswordFormDataCopyWith(_ResetPasswordFormData value,
          $Res Function(_ResetPasswordFormData) then) =
      __$ResetPasswordFormDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {EmailAddress emailAddress,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ResetPasswordFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$ResetPasswordFormDataCopyWithImpl<$Res>
    extends _$ResetPasswordFormDataCopyWithImpl<$Res>
    implements _$ResetPasswordFormDataCopyWith<$Res> {
  __$ResetPasswordFormDataCopyWithImpl(_ResetPasswordFormData _value,
      $Res Function(_ResetPasswordFormData) _then)
      : super(_value, (v) => _then(v as _ResetPasswordFormData));

  @override
  _ResetPasswordFormData get _value => super._value as _ResetPasswordFormData;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_ResetPasswordFormData(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
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
              as Option<Either<ResetPasswordFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_ResetPasswordFormData implements _ResetPasswordFormData {
  const _$_ResetPasswordFormData(
      {required this.emailAddress,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final EmailAddress emailAddress;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ResetPasswordFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'ResetPasswordFormData(emailAddress: $emailAddress, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResetPasswordFormData &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
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
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  _$ResetPasswordFormDataCopyWith<_ResetPasswordFormData> get copyWith =>
      __$ResetPasswordFormDataCopyWithImpl<_ResetPasswordFormData>(
          this, _$identity);
}

abstract class _ResetPasswordFormData implements ResetPasswordFormData {
  const factory _ResetPasswordFormData(
      {required EmailAddress emailAddress,
      required bool showErrorMessages,
      required bool isSubmitting,
      required Option<Either<ResetPasswordFailure, Unit>>
          authFailureOrSuccessOption}) = _$_ResetPasswordFormData;

  @override
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  @override
  bool get showErrorMessages => throw _privateConstructorUsedError;
  @override
  bool get isSubmitting => throw _privateConstructorUsedError;
  @override
  Option<Either<ResetPasswordFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ResetPasswordFormDataCopyWith<_ResetPasswordFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

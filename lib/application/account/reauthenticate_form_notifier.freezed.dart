// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reauthenticate_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReauthenticateFormData {
  Password get password => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<ReauthenticateFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReauthenticateFormDataCopyWith<ReauthenticateFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReauthenticateFormDataCopyWith<$Res> {
  factory $ReauthenticateFormDataCopyWith(ReauthenticateFormData value,
          $Res Function(ReauthenticateFormData) then) =
      _$ReauthenticateFormDataCopyWithImpl<$Res, ReauthenticateFormData>;
  @useResult
  $Res call(
      {Password password,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ReauthenticateFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$ReauthenticateFormDataCopyWithImpl<$Res,
        $Val extends ReauthenticateFormData>
    implements $ReauthenticateFormDataCopyWith<$Res> {
  _$ReauthenticateFormDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ReauthenticateFailure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReauthenticateFormDataCopyWith<$Res>
    implements $ReauthenticateFormDataCopyWith<$Res> {
  factory _$$_ReauthenticateFormDataCopyWith(_$_ReauthenticateFormData value,
          $Res Function(_$_ReauthenticateFormData) then) =
      __$$_ReauthenticateFormDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Password password,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ReauthenticateFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$$_ReauthenticateFormDataCopyWithImpl<$Res>
    extends _$ReauthenticateFormDataCopyWithImpl<$Res,
        _$_ReauthenticateFormData>
    implements _$$_ReauthenticateFormDataCopyWith<$Res> {
  __$$_ReauthenticateFormDataCopyWithImpl(_$_ReauthenticateFormData _value,
      $Res Function(_$_ReauthenticateFormData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_$_ReauthenticateFormData(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ReauthenticateFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_ReauthenticateFormData implements _ReauthenticateFormData {
  const _$_ReauthenticateFormData(
      {required this.password,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final Password password;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ReauthenticateFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'ReauthenticateFormData(password: $password, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReauthenticateFormData &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                other.authFailureOrSuccessOption ==
                    authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password, showErrorMessages,
      isSubmitting, authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReauthenticateFormDataCopyWith<_$_ReauthenticateFormData> get copyWith =>
      __$$_ReauthenticateFormDataCopyWithImpl<_$_ReauthenticateFormData>(
          this, _$identity);
}

abstract class _ReauthenticateFormData implements ReauthenticateFormData {
  const factory _ReauthenticateFormData(
      {required final Password password,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<ReauthenticateFailure, Unit>>
          authFailureOrSuccessOption}) = _$_ReauthenticateFormData;

  @override
  Password get password;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<ReauthenticateFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_ReauthenticateFormDataCopyWith<_$_ReauthenticateFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

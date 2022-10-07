// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'modify_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ModifyFormData {
  Nom get userName => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ModifyFormDataCopyWith<ModifyFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModifyFormDataCopyWith<$Res> {
  factory $ModifyFormDataCopyWith(
          ModifyFormData value, $Res Function(ModifyFormData) then) =
      _$ModifyFormDataCopyWithImpl<$Res>;
  $Res call(
      {Nom userName,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$ModifyFormDataCopyWithImpl<$Res>
    implements $ModifyFormDataCopyWith<$Res> {
  _$ModifyFormDataCopyWithImpl(this._value, this._then);

  final ModifyFormData _value;
  // ignore: unused_field
  final $Res Function(ModifyFormData) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as Nom,
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
abstract class _$$_ModifyFormDataCopyWith<$Res>
    implements $ModifyFormDataCopyWith<$Res> {
  factory _$$_ModifyFormDataCopyWith(
          _$_ModifyFormData value, $Res Function(_$_ModifyFormData) then) =
      __$$_ModifyFormDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {Nom userName,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$$_ModifyFormDataCopyWithImpl<$Res>
    extends _$ModifyFormDataCopyWithImpl<$Res>
    implements _$$_ModifyFormDataCopyWith<$Res> {
  __$$_ModifyFormDataCopyWithImpl(
      _$_ModifyFormData _value, $Res Function(_$_ModifyFormData) _then)
      : super(_value, (v) => _then(v as _$_ModifyFormData));

  @override
  _$_ModifyFormData get _value => super._value as _$_ModifyFormData;

  @override
  $Res call({
    Object? userName = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_ModifyFormData(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as Nom,
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

class _$_ModifyFormData implements _ModifyFormData {
  const _$_ModifyFormData(
      {required this.userName,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final Nom userName;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'ModifyFormData(userName: $userName, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModifyFormData &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
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
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(authFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_ModifyFormDataCopyWith<_$_ModifyFormData> get copyWith =>
      __$$_ModifyFormDataCopyWithImpl<_$_ModifyFormData>(this, _$identity);
}

abstract class _ModifyFormData implements ModifyFormData {
  const factory _ModifyFormData(
      {required final Nom userName,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<AuthFailure, Unit>>
          authFailureOrSuccessOption}) = _$_ModifyFormData;

  @override
  Nom get userName;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_ModifyFormDataCopyWith<_$_ModifyFormData> get copyWith =>
      throw _privateConstructorUsedError;
}

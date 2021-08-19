import 'package:base_de_projet/domain/auth/reauthenticate_failure.dart';
import 'package:base_de_projet/domain/auth/value_objects.dart';
import 'package:base_de_projet/infrastructure/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'reauthenticate_form_notifier.freezed.dart';

@freezed
class ReauthenticateFormData with _$ReauthenticateFormData {
  const factory ReauthenticateFormData({
    required Password password,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<ReauthenticateFailure, Unit>>
        authFailureOrSuccessOption,
  }) = _ReauthenticateFormData;

  factory ReauthenticateFormData.initial() => ReauthenticateFormData(
      password: Password(''),
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none());
}

class ReauthenticateFormNotifier extends StateNotifier<ReauthenticateFormData> {
  final AuthRepository _authRepository;

  ReauthenticateFormNotifier(this._authRepository)
      : super(ReauthenticateFormData.initial());

  passwordChanged(String passwordStr) {
    state = state.copyWith(
        password: Password(passwordStr), authFailureOrSuccessOption: none());
  }

  reauthenticateWithEmailAndPasswordPressed() async {
    Either<ReauthenticateFailure, Unit>? failureOrSuccess;

    final isPasswordValid = state.password.isValid();
    if (isPasswordValid) {
      state = state.copyWith(
          isSubmitting: true, authFailureOrSuccessOption: none());

      failureOrSuccess = await this
          ._authRepository
          .reauthenticateWithPassword(password: state.password);

      if (failureOrSuccess.isRight()) {
        //Reinitialise le formulaire
        state = state.copyWith(password: Password(""));
      }
    }

    state = state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: failureOrSuccess != null
            ? some(failureOrSuccess)
            : none()); //optionOf -> value != null ? some(value) : none();     | optionOf ne fonctionne pas
  }
}

import 'package:base_de_projet/domain/auth/auth_failure.dart';
import 'package:base_de_projet/domain/auth/user_data.dart';
import 'package:base_de_projet/domain/auth/value_objects.dart';
import 'package:base_de_projet/domain/core/value_objects.dart';
import 'package:base_de_projet/infrastructure/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'modify_form_notifier.freezed.dart';

@freezed
class ModifyFormData with _$ModifyFormData {
  const factory ModifyFormData({
    required Nom nomUtilisateur,
    required EmailAddress emailAddress,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _ModifyFormData;

  factory ModifyFormData.initial() => ModifyFormData(
      nomUtilisateur: Nom(''),
      emailAddress: EmailAddress(''),
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none());
}

class ModifyFormNotifier extends StateNotifier<ModifyFormData> {
  final AuthRepository _authRepository;

  ModifyFormNotifier(this._authRepository) : super(ModifyFormData.initial());

  setValueWithUserData(UserData userData) {
    state = state.copyWith(
      nomUtilisateur: userData.userName,
      emailAddress: userData.email,
    );
  }

  nomUtilisateurChanged(String nomStr) {
    state = state.copyWith(
        nomUtilisateur: Nom(nomStr), authFailureOrSuccessOption: none());
  }

  emailChanged(String emailStr) {
    state = state.copyWith(
        emailAddress: EmailAddress(emailStr),
        authFailureOrSuccessOption: none());
  }

  modifyPressed() async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isUserNameValid = state.nomUtilisateur.isValid();
    final isEmailValid = state.emailAddress.isValid();
    if (isUserNameValid && isEmailValid) {
      state = state.copyWith(
          isSubmitting: true, authFailureOrSuccessOption: none());
      failureOrSuccess = await this._authRepository.modifyAccount(
            userData: UserData(
                id: UniqueId(),
                userName: state.nomUtilisateur,
                email: state.emailAddress,
                passwordCrypted: true),
          );
    }

    state = state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: failureOrSuccess != null
            ? some(failureOrSuccess)
            : none()); //optionOf -> value != null ? some(value) : none();     | optionOf ne fonctionne pas
  }
}

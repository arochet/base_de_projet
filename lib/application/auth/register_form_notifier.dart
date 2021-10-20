import 'package:base_de_projet/domain/auth/auth_failure.dart';
import 'package:base_de_projet/domain/auth/user_data.dart';
import 'package:base_de_projet/domain/auth/value_objects.dart';
import 'package:base_de_projet/domain/core/value_objects.dart';
import 'package:base_de_projet/infrastructure/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_form_notifier.freezed.dart';

@freezed
class RegisterFormData with _$RegisterFormData {
  const factory RegisterFormData({
    required Nom nomUtilisateur,
    required EmailAddress emailAddress,
    required Password password,
    required PasswordConfirmation passwordConfirmation,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _RegisterFormData;

  factory RegisterFormData.initial() => RegisterFormData(
      nomUtilisateur: Nom(''),
      emailAddress: EmailAddress(''),
      password: Password(''),
      passwordConfirmation: PasswordConfirmation('', ''),
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none());
}

class RegisterFormNotifier extends StateNotifier<RegisterFormData> {
  final AuthRepository _authRepository;

  RegisterFormNotifier(this._authRepository)
      : super(RegisterFormData.initial());

  nomUtilisateurChanged(String nomStr) {
    state = state.copyWith(
        nomUtilisateur: Nom(nomStr), authFailureOrSuccessOption: none());
  }

  emailChanged(String emailStr) {
    state = state.copyWith(
        emailAddress: EmailAddress(emailStr),
        authFailureOrSuccessOption: none());
  }

  passwordChanged(String passwordStr) {
    state = state.copyWith(
        password: Password(passwordStr), authFailureOrSuccessOption: none());
  }

  passwordConfirmationChanged(String passwordStr) {
    state = state.copyWith(
        passwordConfirmation: PasswordConfirmation(
            state.password.value.getOrElse(() => ''), passwordStr),
        authFailureOrSuccessOption: none());
  }

  registerWithEmailAndPasswordPressed() async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isUserNameValid = state.nomUtilisateur.isValid();
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    final isPasswordConfirmationValid = state.passwordConfirmation.isValid();
    if (isUserNameValid &&
        isEmailValid &&
        isPasswordValid &&
        isPasswordConfirmationValid) {
      state = state.copyWith(
          isSubmitting: true, authFailureOrSuccessOption: none());

      failureOrSuccess = await this
          ._authRepository
          .registerWithEmailAndPassword(
              userData: UserData(
                  id: UniqueId(),
                  userName: state.nomUtilisateur,
                  email: state.emailAddress,
                  passwordCrypted: true,
                  typeAccount: TypeAccount(TypeAccountState.email)),
              emailAddress: state.emailAddress,
              password: state.password);

      if (failureOrSuccess.isRight()) {
        state = state.copyWith(
            nomUtilisateur: Nom(""),
            emailAddress: EmailAddress(""),
            password: Password(""));
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

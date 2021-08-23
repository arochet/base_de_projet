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
    required Nom prenom,
    required Nom nom,
    required Nom nomUtilisateur,
    required Telephone telephone,
    required EmailAddress emailAddress,
    required Password password,
    required PasswordConfirmation passwordConfirmation,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _RegisterFormData;

  factory RegisterFormData.initial() => RegisterFormData(
      prenom: Nom(''),
      nom: Nom(''),
      nomUtilisateur: Nom(''),
      telephone: Telephone(''),
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

  prenomChanged(String nomStr) {
    state =
        state.copyWith(prenom: Nom(nomStr), authFailureOrSuccessOption: none());
  }

  nomChanged(String nomStr) {
    state =
        state.copyWith(nom: Nom(nomStr), authFailureOrSuccessOption: none());
  }

  nomUtilisateurChanged(String nomStr) {
    state = state.copyWith(
        nomUtilisateur: Nom(nomStr), authFailureOrSuccessOption: none());
  }

  telephoneChanged(String telephoneStr) {
    state = state.copyWith(
        telephone: Telephone(telephoneStr), authFailureOrSuccessOption: none());
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

    final isFirstNameValid = state.prenom.isValid();
    final isNameValid = state.nom.isValid();
    final isUserNameValid = state.nomUtilisateur.isValid();
    final isPhoneValid = state.telephone.isValid();
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    final isPasswordConfirmationValid = state.passwordConfirmation.isValid();
    if (isFirstNameValid &&
        isNameValid &&
        isUserNameValid &&
        isPhoneValid &&
        isEmailValid &&
        isPasswordValid &&
        isPasswordConfirmationValid) {
      state = state.copyWith(
          isSubmitting: true, authFailureOrSuccessOption: none());

      failureOrSuccess =
          await this._authRepository.registerWithEmailAndPassword(
              userData: UserData(
                id: UniqueId(),
                firstName: state.prenom,
                name: state.nom,
                userName: state.nomUtilisateur,
                phone: state.telephone,
                email: state.emailAddress,
                passwordCrypted: true,
              ),
              password: state.password);

      if (failureOrSuccess.isRight()) {
        state = state.copyWith(
            prenom: Nom(""),
            nom: Nom(""),
            nomUtilisateur: Nom(""),
            telephone: Telephone(""),
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

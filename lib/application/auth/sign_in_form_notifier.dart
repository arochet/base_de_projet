import 'package:base_de_projet/domain/auth/auth_failure.dart';
import 'package:base_de_projet/domain/auth/value_objects.dart';
import 'package:base_de_projet/infrastructure/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_in_form_notifier.freezed.dart';

@freezed
class SignInFormData with _$SignInFormData {
  const factory SignInFormData({
    required EmailAddress emailAddress,
    required Password password,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormData;

  factory SignInFormData.initial() => SignInFormData(
      emailAddress: EmailAddress(''),
      password: Password(''),
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none());
}

class SignInFormNotifier extends StateNotifier<SignInFormData> {
  final AuthRepository _authRepository;

  SignInFormNotifier(this._authRepository) : super(SignInFormData.initial());

  emailChanged(String emailStr) {
    state = state.copyWith(
        emailAddress: EmailAddress(emailStr),
        authFailureOrSuccessOption: none());
  }

  passwordChanged(String passwordStr) {
    state = state.copyWith(
        password: Password(passwordStr), authFailureOrSuccessOption: none());
  }

  registerWithEmailAndPasswordPressed() {
    _performActionOnAuthFacadeWithEmailAndPassword(
        this._authRepository.registerWithEmailAndPassword);
  }

  signInWithEmailAndPasswordPressed() {
    _performActionOnAuthFacadeWithEmailAndPassword(
        this._authRepository.signInWithEmailAndPassword);
  }

  signInWithGooglePressed() async {
    state =
        state.copyWith(isSubmitting: true, authFailureOrSuccessOption: none());
    final failureOrSuccess = await _authRepository.signInWithGoogle();
    print(
        "Application/Auth => signInWithGooglePressed() failureOrSuccess $failureOrSuccess");
    state = state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption:
            failureOrSuccess != null ? some(failureOrSuccess) : none());
  }

  _performActionOnAuthFacadeWithEmailAndPassword(
      Future<Either<AuthFailure, Unit>> Function(
              {required EmailAddress emailAdress, required Password password})
          forwardedCall) async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    print("Application/Auth => email valid : $isEmailValid");
    print("Application/Auth => password valid : $isPasswordValid");
    if (isEmailValid && isPasswordValid) {
      state = state.copyWith(
          isSubmitting: true, authFailureOrSuccessOption: none());

      failureOrSuccess = await forwardedCall(
          emailAdress: state.emailAddress, password: state.password);
      print("Application/Auth => failureOrSuccess $failureOrSuccess");
    }

    state = state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: failureOrSuccess != null
            ? some(failureOrSuccess)
            : none()); //optionOf -> value != null ? some(value) : none();     | optionOf ne fonctionne pas
  }
}

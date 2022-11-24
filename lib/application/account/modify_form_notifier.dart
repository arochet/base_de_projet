import 'package:base_de_projet/DOMAIN/auth/auth_failure.dart';
import 'package:base_de_projet/DOMAIN/auth/user_data.dart';
import 'package:base_de_projet/DOMAIN/auth/value_objects.dart';
import 'package:base_de_projet/INFRASTRUCTURE/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'modify_form_notifier.freezed.dart';

@freezed
class ModifyFormData with _$ModifyFormData {
  const factory ModifyFormData({
    required Nom userName,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _ModifyFormData;

  factory ModifyFormData.initial() => ModifyFormData(
      userName: Nom(''), showErrorMessages: false, isSubmitting: false, authFailureOrSuccessOption: none());
}

class ModifyFormNotifier extends StateNotifier<ModifyFormData> {
  final AuthRepository _authRepository;

  ModifyFormNotifier(this._authRepository) : super(ModifyFormData.initial());

  setValueWithUserData(UserData userData) {
    state = state.copyWith(
      userName: userData.userName,
    );
  }

  userNameChanged(String nomStr) {
    state = state.copyWith(userName: Nom(nomStr), authFailureOrSuccessOption: none());
  }

  modifyPressed() async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isUserNameValid = state.userName.isValid();
    if (isUserNameValid) {
      state = state.copyWith(isSubmitting: true, authFailureOrSuccessOption: none());
      failureOrSuccess = await this._authRepository.modifyAccount(userName: state.userName);
    }

    state = state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: failureOrSuccess != null
            ? some(failureOrSuccess)
            : none()); //optionOf -> value != null ? some(value) : none();     | optionOf ne fonctionne pas
  }
}

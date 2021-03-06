import 'package:base_de_projet/domain/auth/value_objects.dart';
import 'package:base_de_projet/infrastructure/auth/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Ajouter freezed !
abstract class AuthState {
  const AuthState();
}

class AuthInital extends AuthState {
  const AuthInital();
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated();
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(AuthInital());

  Future authCheckRequested() async {
    try {
      final userOption = await _authRepository.getSignedUser();
      state = await userOption.fold(() => AuthUnauthenticated(), (a) async {
        if (_authRepository.isUserEmailVerified())
          return AuthAuthenticated();
        else
          return AuthAuthenticated();
      });
    } catch (e) {}
  }

  bool authCheckEmail() {
    return _authRepository.isUserEmailVerified();
  }

  Future signOut() async {
    await _authRepository.signOut();
    state = AuthUnauthenticated();
  }

  Future deleteAccount(TypeAccountState type) async {
    switch (type) {
      case TypeAccountState.email:
        await _authRepository.deleteAccountWithEmailAndPassword();
        break;
      case TypeAccountState.google:
        await _authRepository.deleteAccountGoogle();
        break;
      case TypeAccountState.facebook:
        await _authRepository.deleteAccountFacebook();
        break;
      default:
        break;
    }
    state = AuthUnauthenticated();
  }

  Future sendEmailVerification() async {
    this._authRepository.sendEmailVerification();
  }
}

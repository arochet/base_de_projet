import 'package:base_de_projet/infrastructure/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
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
      state = userOption.fold(
          () => AuthUnauthenticated(), (a) => AuthAuthenticated());
    } catch (e) {}
  }

  Future signOut() async {
    await _authRepository.signOut();
    state = AuthUnauthenticated();
  }

  Future deleteAccount() async {
    await _authRepository.deleteAccountWithEmailAndPassword();
    state = AuthUnauthenticated();
  }
}

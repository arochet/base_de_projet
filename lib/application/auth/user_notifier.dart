import 'package:base_de_projet/domain/auth/user.dart';
import 'package:base_de_projet/infrastructure/auth/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<User?> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(null);
}

import 'package:base_de_projet/injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ADMIN_INFRASTRUCTURE/user/users_repository.dart';

//USERS
final userRepositoryProvider = Provider<UsersRepository>((ref) => getIt<UsersRepository>());

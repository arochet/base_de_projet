import 'package:admin/injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'ADMIN_INFRASTRUCTURE/user/users_repository.dart';

//USERS
final userRepositoryProvider = Provider<UsersRepository>((ref) => getItAdmin<UsersRepository>());

//HOME PAGE
final currentPageNavProvider = StateProvider<int?>((ref) => null);

//ENVIRONNEMENT
final environment = StateProvider<Environment>((ref) => Environment(Environment.dev));
final showFilePath = StateProvider<bool>((ref) => false);

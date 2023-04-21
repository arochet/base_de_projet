import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:base_de_projet/injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configurationInjection() {
  getIt.init();
}

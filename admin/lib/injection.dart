import 'package:base_de_projet/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:admin/injection.config.dart';

final GetIt getItAdmin = GetIt.instance;

@injectableInit
void configurationInjection(String env) {
  //Sert à afficher les logs en mode dev
  getItAdmin.registerSingleton<AppLog>(AppLog());
  getItAdmin.init(environment: env);
}

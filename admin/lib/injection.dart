import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:admin/injection.config.dart';

final GetIt getItAdmin = GetIt.instance;

@injectableInit
void configurationInjection() {
  getItAdmin.init();
}

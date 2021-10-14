import 'package:base_de_projet/main_common.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  await mainCommon(Environment(Environment.test));
}

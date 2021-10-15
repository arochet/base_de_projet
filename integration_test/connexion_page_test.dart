import 'package:base_de_projet/presentation/auth/auth_connexion/auth_connexion.dart';
import 'package:flutter_test/flutter_test.dart';

import 'app_test.dart';

void main() {
  testWidgets(
    "Test Auth - Connexion Page",
    (WidgetTester tester) async {
      await tester.pumpWidget(buildMainWidget(AuthConnexionPage()));

      await tester.pump();
      expect(find.text("Se Connecter"), findsOneWidget);
    },
  );
}

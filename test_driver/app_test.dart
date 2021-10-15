import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('[Test Driver]', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.waitUntilFirstFrameRasterized(); //Test ?
    });

    tearDownAll(() async {
      driver.close();
    });

    test('Connexion', () async {
      await driver.clearTimeline();
      await connexion(driver);
      expect(await driver.getText(find.text("Home")), "Home");
    });
  });
}

connexion(FlutterDriver driver) async {
  //S'il l'on est déjà connecter
  /* final present = await isPresent(find.text('Se Connecter'), driver);
  if (!present) {
    //Déconnexion
    print("Déconnexion - 1");
    await driver.tap(find.byValueKey("nav-home"));
    print("Déconnexion - 1 bis");
    await driver.waitFor(find.text("Jouer"));
    print("Déconnexion - 2");
    await driver.tap(find.byValueKey("nav-account"));
    print("Déconnexion - 3");
    await driver.waitFor(find.text("Données"));
    print("Déconnexion - 4");
    await driver.tap(find.text("Données"));
    print("Déconnexion - 5");
    await driver.waitFor(find.text("Modifier"));
    print("Déconnexion - 6");
    await driver.tap(find.text("Modifier"));
    print("Déconnexion - 7");
    await driver.tap(find.text("Se déconnecter"));
    print("Déconnexion - 8");
  }
  print("Connexion - 1");
  await driver.tap(find.text('Se Connecter'));
  print("Connexion - 2");
  await driver.waitFor(find.text('Mot de passe oublié ?'));
  print("Connexion - 3");
  await driver.tap(find.byValueKey('email-field'));
  print("Connexion - 4");
  await driver.enterText("albanrochet@gmail.com");
  print("Connexion - 5");
  await driver.waitFor(find.text("albanrochet@gmail.com"));
  print("Connexion - 6");
  await driver.tap(find.byValueKey('password-field'));
  print("Connexion - 7");
  await driver.enterText("azerazer");
  print("Connexion - 8");
  await driver.waitFor(find.text("azerazer"));
  print("Connexion - 9");
  await driver.tap(find.text("Se Connecter"));
  print("Connexion - 10");
  await Future.delayed(const Duration(seconds: 2));
  await driver.waitFor(find.text("Jouer"), timeout: Duration(seconds: 5));
  print("Connexion - 11"); */
}

Future<bool> isPresent(SerializableFinder byValueKey, FlutterDriver driver,
    {Duration timeout = const Duration(seconds: 1)}) async {
  try {
    await driver.waitFor(byValueKey, timeout: timeout);
    return true;
  } catch (exception) {
    return false;
  }
}

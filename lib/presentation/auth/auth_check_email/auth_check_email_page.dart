import 'package:base_de_projet/presentation/components/some_widgets.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/presentation/home/home_page.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthCheckEmailPage extends StatefulWidget {
  const AuthCheckEmailPage({Key? key}) : super(key: key);

  @override
  _AuthCheckEmailPageState createState() => _AuthCheckEmailPageState();
}

class _AuthCheckEmailPageState extends State<AuthCheckEmailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      //Verififie que l'email est bien vérifié
      if (context.read(authNotifierProvider.notifier).authCheckEmail()) {
        Navigator.pushReplacementNamed(context, AppRouter.home,
            arguments: HomeArguments(0));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar,
      body: Consumer(builder: (context, watch, state) {
        final ok = context.read(authNotifierProvider.notifier).authCheckEmail();
        if (ok)
          return Center(
            child: Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text("Verification de l'email"),
              ],
            ),
          );
        else
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bienvenue ! \n Vérifiez votre compte dans votre boite mail",
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read(authNotifierProvider.notifier)
                        .sendEmailVerification();
                  },
                  child: Text(
                    "Renvoyer un mail",
                  ),
                  style: buttonPrimaryNormal,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.authInit);
                  },
                  child: Text(
                    "connexion",
                  ),
                  style: buttonPrimaryNormal,
                )
              ],
            ),
          );
      }),
    );
  }
}

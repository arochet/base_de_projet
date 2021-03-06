import 'package:base_de_projet/presentation/components/some_widgets.dart';
import 'package:base_de_projet/presentation/core/router.gr.dart';
import 'package:base_de_projet/presentation/core/theme_button.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthCheckEmailPage extends ConsumerStatefulWidget {
  const AuthCheckEmailPage({Key? key}) : super(key: key);

  @override
  _AuthCheckEmailPageState createState() => _AuthCheckEmailPageState();
}

class _AuthCheckEmailPageState extends ConsumerState<AuthCheckEmailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      //Verififie que l'email est bien vérifié
      if (ref.read(authNotifierProvider.notifier).authCheckEmail()) {
        ref.read(currentPageNavProvider.notifier).state = 0;
        context.router
            .replaceAll([MainNavigationRoute(/* children: [HomeRoute] */)]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar,
      body: Consumer(builder: (context, watch, state) {
        final ok = ref.read(authNotifierProvider.notifier).authCheckEmail();
        if (ok)
          return Center(
            child: Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text(AppLocalizations.of(context)!.verificationemail),
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
                  "${AppLocalizations.of(context)!.bienvenue} ${AppLocalizations.of(context)!.verifierdansboiteemail}",
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(authNotifierProvider.notifier)
                        .sendEmailVerification();
                  },
                  child: Text(AppLocalizations.of(context)!.renvoyerunemail),
                  style: buttonNormalPrimary,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.router.push(AuthConnexionRoute());
                  },
                  child: Text(
                    AppLocalizations.of(context)!.seconnecter,
                  ),
                  style: buttonNormalPrimary,
                )
              ],
            ),
          );
      }),
    );
  }
}

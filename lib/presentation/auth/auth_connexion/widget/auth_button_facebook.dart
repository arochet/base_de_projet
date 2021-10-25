import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonFacebook extends StatelessWidget {
  const ButtonFacebook({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: SignInButton(
        Buttons.Facebook,
        text: AppLocalizations.of(context)!.connexionavecfacebook,
        onPressed: () {
          context
              .read(signInFormNotifierProvider.notifier)
              .signInWithFacebookPressed();
        },
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40.0))),
      ),
    );
  }
}

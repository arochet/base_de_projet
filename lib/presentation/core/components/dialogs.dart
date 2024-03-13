//PASSWORD
import 'dart:async';

import 'package:base_de_projet/DOMAIN/auth/value_objects.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../core/app_widget.dart';
import 'show_component_file.dart';

//DIALOG
Future<dynamic> showDialogApp<T>(
    {required BuildContext context, required Widget child, String? titre, List<Widget>? actions}) async {
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
        title: titre != null
            ? Text(
                titre,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              )
            : null,
        content: child,
        actionsAlignment: MainAxisAlignment.center,
        actions: actions,
      );
    },
  );
}

//DIALOG CHOIX
Future<bool?> showDialogChoix(BuildContext context, String titre,
    {String? positiveText, String? negativeText, bool isDanger = false, final Widget? container}) async {
  final bool? choix = await showDialogApp<bool?>(
    context: context,
    titre: titre,
    child: container ?? Container(height: 0),
    actions: <Widget>[
      if (negativeText != null)
        TextButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(false);
          },
          child: Text(negativeText!),
        ),
      SizedBox(width: 10),
      isDanger || negativeText != null
          ? ElevatedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop(true);
              },
              child: Text(positiveText ?? 'Yes -'), //oui
              style: isDanger ? Theme.of(context).extension<AppThemeExtention>()?.buttonDanger : null,
            )
          : TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop(true);
              },
              child: Text(positiveText ?? 'No -'), //non
            ),
    ],
  );
  return choix;
}

/// Vérifier le mot de passe de l'utilisateur
Future<bool?> showDialogPassword<bool>(
    {required BuildContext context, required WidgetRef ref, required bool dissmissable}) async {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController? controller = TextEditingController();
  String? textError;

  return showDialog<bool>(
    context: context,
    barrierDismissible: dissmissable == true,
    barrierColor: dissmissable == false ? colorpanel(700) : Colors.black54,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context2, setState) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text('Entrez le mot de passe', textAlign: TextAlign.center),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Mot de passe',
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: colorpanel(200)),
                      errorText: textError,
                    ),
                    keyboardType: TextInputType.text,
                    controller: controller,
                    obscureText: true,
                    autofocus: true,
                    onChanged: (value) {
                      setState(() {
                        textError = null;
                      });
                    },
                    onFieldSubmitted: (value) async {
                      final res = await reauthenticate(
                          controller,
                          ref,
                          context,
                          () => setState(() {
                                textError = "Mot de passe incorrect";
                              }));
                      if (res) {
                        try {
                          Navigator.of(context2).pop(true);
                        } catch (e) {
                          print('error: $e');
                        }
                      }
                    }),
              ],
            ),
          ),
          backgroundColor: colorpanel(800),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            if (dissmissable == true) ...[
              TextButton(
                  child: const Text('Annuler'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  }),
              SizedBox(width: 10),
            ],
            ElevatedButton(
                child: const Text('Valider'),
                onPressed: () async {
                  final res = await reauthenticate(
                      controller,
                      ref,
                      context,
                      () => setState(() {
                            textError = "Mot de passe incorrect";
                          }));
                  if (res) {
                    try {
                      Navigator.of(context2).pop(true);
                    } catch (e) {
                      print('error: $e');
                    }
                  }
                }),
          ],
        );
      });
    },
  );
}

/// Vérifier le mot de passe de l'utilisateur dans Firebase
Future<bool> reauthenticate(
    TextEditingController controller, WidgetRef ref, BuildContext context, Function updateTxtError) async {
  Password password = Password(controller.text);

  //Mot de passe incorrect
  if (password.isValid() == false) {
    updateTxtError();
    controller.clear();
    return false;
  }

  //Vérification du mot de passe avec Firebase
  final passwordOK =
      await ref.read(authRepositoryProvider).reauthenticateWithPassword(password: Password(controller.text));
  if (passwordOK.isRight()) {
    if (!Navigator.canPop(context)) {
      return false; // La boîte de dialogue a été fermée
    }
    return true;
  } else {
    updateTxtError();
    controller.clear();
    return false;
  }
}

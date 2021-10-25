// import 'package:another_flushbar/flushbar.dart';
import 'package:base_de_projet/application/account/modify_form_notifier.dart';
import 'package:base_de_projet/presentation/auth/widget/flushbar_auth_failure.dart';
import 'package:base_de_projet/presentation/core/theme_button.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/presentation/core/router.gr.dart';

class ModifyAccountForm extends StatelessWidget {
  const ModifyAccountForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
        provider: modifyFormNotifierProvider,
        onChange: (context, ModifyFormData myRegisterState) {
          myRegisterState.authFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold((failure) {
                    //Message d'erreur
                    FlushbarAuthFailure.show(context, failure);
                  }, (_) {
                    //Authentification réussie !
                    Future.delayed(Duration.zero, () async {
                      context.refresh(currentUserData);
                      await context.router.replaceAll([
                        MainNavigationRoute(children: [AccountRoute()])
                      ]);
                    });
                  }));
        },
        child: FormModifyAccount());
  }
}

class FormModifyAccount extends StatefulWidget {
  const FormModifyAccount({
    Key? key,
  }) : super(key: key);

  @override
  _FormModifyAccountState createState() => _FormModifyAccountState();
}

class _FormModifyAccountState extends State<FormModifyAccount> {
  //CONTROLLER DU FORMULAIRE POUR L'INITIALISATION DES VALEURS DES CHAMPS
  TextEditingController _controllerUserName =
      new TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => load(context));
  }

  load(BuildContext context) async {
    //Charge les données de l'utilisateur courant
    final dataAsync = context.read(currentUserData);
    dataAsync.whenData(
      (dataUser) async {
        if (dataUser != null) {
          //Initialisation du Modify Form Notifier
          context
              .read(modifyFormNotifierProvider.notifier)
              .setValueWithUserData(dataUser);

          //Remplis le formulaire
          setState(() {
            _controllerUserName =
                new TextEditingController(text: dataUser.userName.getOrCrash());
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      watch(modifyFormNotifierProvider); //Pour mettre à jour le validator !

      return Form(
        autovalidateMode: AutovalidateMode.always,
        child: ListView(padding: const EdgeInsets.all(18), children: [
          const SizedBox(height: 8),
          //NOM UTILISATEUR
          TextFormField(
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.nomutilisateur,
            ),
            autocorrect: false,
            onChanged: (value) {
              context
                  .read(modifyFormNotifierProvider.notifier)
                  .userNameChanged(value);
            },
            validator: (_) {
              final registerData = context.read(modifyFormNotifierProvider);

              if (registerData.showErrorMessages) {
                return registerData.userName.value.fold(
                  (f) => f.maybeMap(
                    exceedingLenghtOrNull: (_) =>
                        AppLocalizations.of(context)!.nominvalide,
                    orElse: () => null,
                  ),
                  (_) => null,
                );
              } else
                return null;
            },
            controller: _controllerUserName,
          ),
          const SizedBox(height: 8),
          //BOUTON MODIFIER
          Align(
            child: ElevatedButton(
              onPressed: () {
                context
                    .read(modifyFormNotifierProvider.notifier)
                    .modifyPressed();
              },
              style: buttonNormalPrimary,
              child: Text(AppLocalizations.of(context)!.modifier),
            ),
          ),
          const SizedBox(height: 12),
          //BARRE DE CHARGEMENT
          if (context.read(modifyFormNotifierProvider).isSubmitting) ...[
            const SizedBox(height: 8),
            const LinearProgressIndicator(value: null)
          ],
          const SizedBox(height: 12),
        ]),
      );
    });
  }
}

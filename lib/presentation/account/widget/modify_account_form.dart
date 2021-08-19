import 'package:another_flushbar/flushbar.dart';
import 'package:base_de_projet/application/auth/modify_form_notifier.dart';
import 'package:base_de_projet/presentation/account/reauthenticate_page.dart';
import 'package:base_de_projet/presentation/auth/widget/flushbar_auth_failure.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/presentation/home/home_page.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                      Navigator.pushReplacementNamed(context, AppRouter.home,
                          arguments: HomeArguments(1));
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
  TextEditingController _controllerFirstName =
      new TextEditingController(text: '');
  TextEditingController _controllerName = new TextEditingController(text: '');
  TextEditingController _controllerUserName =
      new TextEditingController(text: '');
  TextEditingController _controllerPhone = new TextEditingController(text: '');

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
            _controllerFirstName = new TextEditingController(
                text: dataUser.firstName.getOrCrash());
            _controllerName =
                new TextEditingController(text: dataUser.name.getOrCrash());
            _controllerUserName =
                new TextEditingController(text: dataUser.userName.getOrCrash());
            _controllerPhone =
                new TextEditingController(text: dataUser.phone.getOrCrash());
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
          //PRENOM
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Prénom',
            ),
            autocorrect: false,
            onChanged: (value) {
              context
                  .read(modifyFormNotifierProvider.notifier)
                  .prenomChanged(value);
            },
            validator: (_) {
              final registerData = context.read(modifyFormNotifierProvider);
              if (registerData.showErrorMessages) {
                return registerData.prenom.value.fold(
                  (f) => f.maybeMap(
                    exceedingLenghtOrNull: (_) => 'Prénom invalide',
                    orElse: () => null,
                  ),
                  (_) => null,
                );
              } else
                return null;
            },
            controller: _controllerFirstName,
          ),
          const SizedBox(height: 8),
          //NOM
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nom',
            ),
            autocorrect: false,
            onChanged: (value) {
              context
                  .read(modifyFormNotifierProvider.notifier)
                  .nomChanged(value);
            },
            validator: (_) {
              final registerData = context.read(modifyFormNotifierProvider);
              if (registerData.showErrorMessages) {
                return registerData.nom.value.fold(
                  (f) => f.maybeMap(
                    exceedingLenghtOrNull: (_) => 'Nom invalide',
                    orElse: () => null,
                  ),
                  (_) => null,
                );
              } else
                return null;
            },
            controller: _controllerName,
          ),
          const SizedBox(height: 8),
          //NOM UTILISATEUR
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Nom d'utilisateur",
            ),
            autocorrect: false,
            onChanged: (value) {
              context
                  .read(modifyFormNotifierProvider.notifier)
                  .nomUtilisateurChanged(value);
            },
            validator: (_) {
              final registerData = context.read(modifyFormNotifierProvider);

              if (registerData.showErrorMessages) {
                return registerData.nomUtilisateur.value.fold(
                  (f) => f.maybeMap(
                    exceedingLenghtOrNull: (_) => 'Nom utilisateur invalide',
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
          //TELEPHONE
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Téléphone',
            ),
            autocorrect: false,
            onChanged: (value) {
              context
                  .read(modifyFormNotifierProvider.notifier)
                  .telephoneChanged(value);
            },
            validator: (_) {
              final registerData = context.read(modifyFormNotifierProvider);
              if (registerData.showErrorMessages) {
                return registerData.telephone.value.fold(
                  (f) => f.maybeMap(
                    invalidPhoneNumber: (_) => 'Téléphone invalide',
                    orElse: () => null,
                  ),
                  (_) => null,
                );
              } else
                return null;
            },
            controller: _controllerPhone,
          ),
          const SizedBox(height: 8),
          //ADRESSE EMAIL
          /* TextFormField(
            decoration: const InputDecoration(
              labelText: 'Adresse Mail',
            ),
            autocorrect: false,
            onChanged: (value) {
              context
                  .read(modifyFormNotifierProvider.notifier)
                  .emailChanged(value);
            },
            validator: (_) {
              final registerData = context.read(modifyFormNotifierProvider);
              if (registerData.showErrorMessages) {
                return registerData.emailAddress.value.fold(
                  (f) => f.maybeMap(
                    invalidEmail: (_) => 'Adresse email invalide',
                    orElse: () => null,
                  ),
                  (_) => null,
                );
              } else
                return null;
            },
            controller: _controllerEmailAdress,
          ),
          const SizedBox(height: 14), */
          //BOUTON MODIFIER
          Align(
            child: ElevatedButton(
              onPressed: () {
                context
                    .read(modifyFormNotifierProvider.notifier)
                    .modifyPressed();
              },
              style: buttonPrimaryNormal,
              child: const Text("Modifier"),
            ),
          ),
          const SizedBox(height: 12),
          //BARRE DE CHARGEMENT
          if (context.read(modifyFormNotifierProvider).isSubmitting) ...[
            const SizedBox(height: 8),
            const LinearProgressIndicator(value: null)
          ],
          const SizedBox(height: 12),
          //BOUTON MODIFIER MDP + SUPPRIMER COMPTE
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, AppRouter.reauthenticate,
                      arguments:
                          ReauthentificationArguments(AppRouter.newPassword));
                },
                style: buttonPrimaryHide,
                child: const Text("Modifier le mot de passe"),
              ),
              ElevatedButton(
                style: buttonPrimaryHide,
                child: const Text("Supprimer le compte"),
                onPressed: () {
                  // set up the buttons
                  Widget cancelButton = TextButton(
                    child: Text("Annuler",
                        style: Theme.of(context).textTheme.button),
                    onPressed: () => Navigator.of(context).pop(),
                  );
                  Widget continueButton = TextButton(
                    child: Text("Supprimer",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(color: Colors.red)),
                    onPressed: () {
                      Navigator.popAndPushNamed(
                          context, AppRouter.reauthenticate,
                          arguments: ReauthentificationArguments(
                              AppRouter.deleteAccount));
                    },
                  );

                  // set up the AlertDialog
                  AlertDialog alert = AlertDialog(
                    title: Text("Attention !"),
                    content: Text(
                        "Etes-vous sur de vouloir supprimer votre compte ?"),
                    actions: [
                      cancelButton,
                      continueButton,
                    ],
                  );

                  // show the dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
              ),
            ],
          )
        ]),
      );
    });
  }
}

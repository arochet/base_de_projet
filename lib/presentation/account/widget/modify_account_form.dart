import 'package:another_flushbar/flushbar.dart';
import 'package:base_de_projet/application/auth/modify_form_notifier.dart';
import 'package:base_de_projet/domain/auth/user_data.dart';
import 'package:base_de_projet/domain/core/value_objects.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
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
                    Flushbar(
                            duration: const Duration(seconds: 3),
                            icon: const Icon(Icons.warning),
                            messageColor: Colors.red,
                            message: failure.map(
                                cancelledByUser: (_) => 'Annulé',
                                serverError: (_) => 'Server Error',
                                emailAlreadyInUse: (_) =>
                                    'Adresse email déjà utilisé',
                                insufficientPermission: (_) =>
                                    'Permission insuffisante',
                                invalidEmailAndPasswordCombination: (_) =>
                                    'Adresse email ou mot de passe invalide'))
                        .show(context);
                  }, (_) {
                    //Authentification réussie !
                    Future.delayed(Duration.zero, () async {
                      Navigator.pop(context);
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
  TextEditingController _controllerEmailAdress =
      new TextEditingController(text: '');

  @override
  void initState() {
    final dataAsync = context.read(currentUserData);
    dataAsync.when(
      data: (dataUser) {
        if (dataUser != null) {
          //To Do !!
          /* context
              .read(modifyFormNotifierProvider.notifier)
              .setValueWithUserData(dataUser); */

          setState(() {
            _controllerFirstName = new TextEditingController(
                text: dataUser.firstName.getOrCrash());
            _controllerName =
                new TextEditingController(text: dataUser.name.getOrCrash());
            _controllerUserName =
                new TextEditingController(text: dataUser.userName.getOrCrash());
            _controllerPhone =
                new TextEditingController(text: dataUser.phone.getOrCrash());
            _controllerEmailAdress =
                new TextEditingController(text: dataUser.email.getOrCrash());
          });
        }
      },
      loading: () => null,
      error: (error, stack) => null,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      watch(modifyFormNotifierProvider);
      return Form(
        autovalidateMode: AutovalidateMode.always,
        child: ListView(padding: const EdgeInsets.all(18), children: [
          const SizedBox(height: 8),
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
          TextFormField(
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
          const SizedBox(height: 14),
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
          if (context.read(modifyFormNotifierProvider).isSubmitting) ...[
            const SizedBox(height: 8),
            const LinearProgressIndicator(value: null)
          ]
        ]),
      );
    });
  }
}

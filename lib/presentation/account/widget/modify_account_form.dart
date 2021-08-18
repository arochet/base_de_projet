import 'package:another_flushbar/flushbar.dart';
import 'package:base_de_projet/application/auth/modify_form_notifier.dart';
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

class FormModifyAccount extends ConsumerWidget {
  const FormModifyAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
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
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Nom',
          ),
          autocorrect: false,
          onChanged: (value) {
            context.read(modifyFormNotifierProvider.notifier).nomChanged(value);
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
        ),
        const SizedBox(height: 14),
        Align(
          child: ElevatedButton(
            onPressed: () {
              context.read(modifyFormNotifierProvider.notifier).modifyPressed();
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
  }
}

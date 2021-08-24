import 'package:base_de_projet/application/auth/register_form_notifier.dart';
import 'package:base_de_projet/presentation/auth/widget/flushbar_auth_failure.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormRegisterProvide extends StatelessWidget {
  const FormRegisterProvide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
        provider: registerFormNotifierProvider,
        onChange: (context, RegisterFormData myRegisterState) {
          myRegisterState.authFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold((failure) {
                    //Message d'erreur
                    FlushbarAuthFailure.show(context, failure);
                  }, (_) {
                    //Authentification réussie !
                    Future.delayed(Duration.zero, () async {
                      context
                          .read(authNotifierProvider.notifier)
                          .authCheckRequested();
                      Navigator.pushReplacementNamed(
                          context, AppRouter.authCheckEmail);
                    });
                  }));
        },
        child: FormRegister());
  }
}

class FormRegister extends ConsumerWidget {
  const FormRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    watch(registerFormNotifierProvider);
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: ListView(padding: const EdgeInsets.all(18), children: [
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Prénom',
          ),
          autocorrect: false,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            context
                .read(registerFormNotifierProvider.notifier)
                .prenomChanged(value);
          },
          validator: (_) {
            final registerData = context.read(registerFormNotifierProvider);
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
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            context
                .read(registerFormNotifierProvider.notifier)
                .nomChanged(value);
          },
          validator: (_) {
            final registerData = context.read(registerFormNotifierProvider);
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
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            context
                .read(registerFormNotifierProvider.notifier)
                .nomUtilisateurChanged(value);
          },
          validator: (_) {
            final registerData = context.read(registerFormNotifierProvider);

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
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            context
                .read(registerFormNotifierProvider.notifier)
                .telephoneChanged(value);
          },
          validator: (_) {
            final registerData = context.read(registerFormNotifierProvider);
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
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            context
                .read(registerFormNotifierProvider.notifier)
                .emailChanged(value);
          },
          validator: (_) {
            final registerData = context.read(registerFormNotifierProvider);
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
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Mot de passe',
          ),
          autocorrect: false,
          textInputAction: TextInputAction.next,
          obscureText: true,
          onChanged: (value) => context
              .read(registerFormNotifierProvider.notifier)
              .passwordChanged(value),
          validator: (_) {
            final registerData = context.read(registerFormNotifierProvider);
            if (registerData.showErrorMessages) {
              return registerData.password.value.fold(
                (f) => f.maybeMap(
                  shortPassword: (_) => 'Mot de passe trop court',
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
            labelText: 'Mot de passe de confirmation',
          ),
          autocorrect: false,
          textInputAction: TextInputAction.done,
          obscureText: true,
          onChanged: (value) => context
              .read(registerFormNotifierProvider.notifier)
              .passwordConfirmationChanged(value),
          validator: (_) {
            final registerData = context.read(registerFormNotifierProvider);
            if (registerData.showErrorMessages) {
              return registerData.passwordConfirmation.value.fold(
                (f) => f.maybeMap(
                  confirmationPasswordFail: (_) =>
                      'Mot de passe de confirmation différent du mot de passe',
                  orElse: () => null,
                ),
                (_) => null,
              );
            } else
              return null;
          },
        ),
        const SizedBox(height: 14),
        ElevatedButton(
          onPressed: () {
            context
                .read(registerFormNotifierProvider.notifier)
                .registerWithEmailAndPasswordPressed();
          },
          style: buttonPrimaryBig,
          child: const Text("S'inscrire"),
        ),
        const SizedBox(height: 12),
        if (context.read(registerFormNotifierProvider).isSubmitting) ...[
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: null)
        ]
      ]),
    );
  }
}

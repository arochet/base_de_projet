import 'package:another_flushbar/flushbar.dart';
import 'package:base_de_projet/application/auth/reset_password_notifier.dart';
import 'package:base_de_projet/presentation/components/some_widgets.dart';
import 'package:base_de_projet/presentation/core/theme_button.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/presentation/core/router.gr.dart';

class AuthResetPasswordPage extends StatelessWidget {
  const AuthResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar,
      body: ProviderListener(
        provider: resetPasswordFormNotifierProvider,
        onChange: (context, ResetPasswordFormData resetPasswordState) {
          resetPasswordState.authFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold((failure) {
                    //Message d'erreur
                    Flushbar(
                        duration: const Duration(seconds: 3),
                        icon: const Icon(Icons.warning),
                        messageColor: Colors.red,
                        message: failure.map(
                          userNotFound: (_) => 'Utilisateur non trouvé',
                          serverError: (_) => 'Server Error',
                        )).show(context);
                  }, (_) {
                    //Authentification réussie !
                    Future.delayed(Duration.zero,
                        () => context.router.push(AuthInitRoute()));
                  }));
        },
        child: FormReauthenticate(),
      ),
    );
  }
}

class FormReauthenticate extends ConsumerWidget {
  const FormReauthenticate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    watch(resetPasswordFormNotifierProvider);
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: ListView(padding: const EdgeInsets.all(18), children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 0),
          child: Text(
            "Votre adresse email",
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        const SizedBox(height: 14),
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email),
            labelText: 'Email',
          ),
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          autofocus: true,
          onChanged: (value) {
            context
                .read(resetPasswordFormNotifierProvider.notifier)
                .emailChanged(value);
          },
          validator: (_) {
            final signIn = context.read(resetPasswordFormNotifierProvider);
            if (signIn.showErrorMessages) {
              return signIn.emailAddress.value.fold(
                (f) => f.maybeMap(
                  invalidEmail: (_) => 'Invalid Email',
                  orElse: () => null,
                ),
                (_) => null,
              );
            } else
              return null;
          },
        ),
        const SizedBox(height: 8),
        //BOUTON VALIDER
        Align(
          child: ElevatedButton(
            onPressed: () {
              context
                  .read(resetPasswordFormNotifierProvider.notifier)
                  .resetPasswordPressed();
            },
            style: buttonNormalPrimary,
            child: const Text("Reinitialiser le mot de passe"),
          ),
        ),
        const SizedBox(height: 12),
        //BARRE DE CHARGEMENT
        if (context.read(resetPasswordFormNotifierProvider).isSubmitting) ...[
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: null)
        ],
        const SizedBox(height: 12),
      ]),
    );
  }
}

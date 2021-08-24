import 'package:another_flushbar/flushbar.dart';
import 'package:base_de_projet/application/account/new_password_form_notifier.dart';
import 'package:base_de_projet/presentation/components/some_widgets.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/presentation/home/home_page.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar,
      body: ProviderListener(
        provider: newPasswordFormNotifierProvider,
        onChange: (context, NewPasswordFormData newPasswordInState) {
          newPasswordInState.authFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold((failure) {
                    //Message d'erreur
                    Flushbar(
                        duration: const Duration(seconds: 3),
                        icon: const Icon(Icons.warning),
                        messageColor: Colors.red,
                        message: failure.map(
                          serverError: (_) => 'Server Error',
                        )).show(context);
                  }, (_) {
                    //Authentification réussie !
                    Future.delayed(Duration.zero, () async {
                      Navigator.pushReplacementNamed(context, AppRouter.home,
                          arguments: HomeArguments(1));
                    });
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
    watch(newPasswordFormNotifierProvider);
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: ListView(padding: const EdgeInsets.all(18), children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 0),
          child: Text(
            "Votre nouveau mot de passe",
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        const SizedBox(height: 14),
        TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.lock),
            labelText: 'Mot de passe',
          ),
          autocorrect: false,
          autofocus: true,
          textInputAction: TextInputAction.next,
          obscureText: true,
          onChanged: (value) => context
              .read(newPasswordFormNotifierProvider.notifier)
              .passwordChanged(value),
          validator: (_) {
            final data = context.read(newPasswordFormNotifierProvider);
            if (data.showErrorMessages) {
              return data.password.value.fold(
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
            prefixIcon: Icon(Icons.lock),
            labelText: 'Confirmation de mot de passe',
          ),
          autocorrect: false,
          textInputAction: TextInputAction.done,
          obscureText: true,
          onChanged: (value) => context
              .read(newPasswordFormNotifierProvider.notifier)
              .passwordConfirmationChanged(value),
          validator: (_) {
            final data = context.read(newPasswordFormNotifierProvider);
            if (data.showErrorMessages) {
              return data.passwordConfirmation.value.fold(
                (f) => f.maybeMap(
                  confirmationPasswordFail: (_) =>
                      'Les mots de passe sont différents',
                  shortPassword: (_) => 'Mot de passe court',
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
                  .read(newPasswordFormNotifierProvider.notifier)
                  .newPasswordPressed();
            },
            style: buttonPrimaryNormal,
            child: const Text("Valider"),
          ),
        ),
        const SizedBox(height: 12),
        //BARRE DE CHARGEMENT
        if (context.read(newPasswordFormNotifierProvider).isSubmitting) ...[
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: null)
        ],
        const SizedBox(height: 12),
      ]),
    );
  }
}

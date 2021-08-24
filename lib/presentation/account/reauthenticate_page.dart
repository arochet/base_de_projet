import 'package:another_flushbar/flushbar.dart';
import 'package:base_de_projet/application/account/reauthenticate_form_notifier.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReauthentificationArguments {
  final String route;
  ReauthentificationArguments(this.route);
}

class ReauthenticatePage extends StatelessWidget {
  const ReauthenticatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as ReauthentificationArguments;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: backgroundColor,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 65,
        ),
      ),
      body: ProviderListener(
        provider: reauthenticateFormNotifierProvider,
        onChange: (context, ReauthenticateFormData reauthenticateInState) {
          reauthenticateInState.authFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold((failure) {
                    //Message d'erreur
                    Flushbar(
                        duration: const Duration(seconds: 3),
                        icon: const Icon(Icons.warning),
                        messageColor: Colors.red,
                        message: failure.map(
                          serverError: (_) => 'Server Error',
                          notAuthenticated: (_) => 'Not Authenticated',
                          invalidCredential: (_) => 'Invalid-Credential',
                          invalidEmail: (_) => 'Invalid Email',
                          userMismatch: (_) => 'User Mismatch',
                          userNotFound: (_) => 'User Not Found',
                          wrongPassword: (_) => 'Mot de passe invalide !',
                          tooManyRequest: (_) =>
                              'Trop de requêtes. Essayez plus tard',
                        )).show(context);
                  }, (_) {
                    //Authentification réussie !
                    Future.delayed(Duration.zero, () async {
                      Navigator.pushReplacementNamed(context, args.route);
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
    watch(reauthenticateFormNotifierProvider);
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: ListView(padding: const EdgeInsets.all(18), children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 0),
          child: Text(
            "Confirmez votre mot de passe",
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
          obscureText: true,
          onChanged: (value) => context
              .read(reauthenticateFormNotifierProvider.notifier)
              .passwordChanged(value),
          validator: (_) {
            final data = context.read(reauthenticateFormNotifierProvider);
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
        //BOUTON VALIDER
        Align(
          child: ElevatedButton(
            onPressed: () {
              context
                  .read(reauthenticateFormNotifierProvider.notifier)
                  .reauthenticateWithEmailAndPasswordPressed();
            },
            style: buttonPrimaryNormal,
            child: const Text("Valider"),
          ),
        ),
        const SizedBox(height: 12),
        //BARRE DE CHARGEMENT
        if (context.read(reauthenticateFormNotifierProvider).isSubmitting) ...[
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: null)
        ],
        const SizedBox(height: 12),
      ]),
    );
  }
}

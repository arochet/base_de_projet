import 'package:another_flushbar/flushbar.dart';
import 'package:base_de_projet/application/account/reauthenticate_form_notifier.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                          serverError: (_) =>
                              AppLocalizations.of(context)!.problemedeserveur,
                          notAuthenticated: (_) =>
                              AppLocalizations.of(context)!.pasconnecte,
                          invalidCredential: (_) => 'Invalid-Credential',
                          invalidEmail: (_) =>
                              AppLocalizations.of(context)!.emailinvalide,
                          userMismatch: (_) => 'User Mismatch',
                          userNotFound: (_) => AppLocalizations.of(context)!
                              .utilisateurpastrouver,
                          wrongPassword: (_) =>
                              AppLocalizations.of(context)!.motdepasseinvalid,
                          tooManyRequest: (_) =>
                              AppLocalizations.of(context)!.tropderequetes,
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
            AppLocalizations.of(context)!.confirmervotremotdepasse,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        const SizedBox(height: 14),
        //MOT DE PASSE
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            labelText: AppLocalizations.of(context)!.motdepasse,
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
                  shortPassword: (_) =>
                      AppLocalizations.of(context)!.motdepassetropcourt,
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
            child: Text(AppLocalizations.of(context)!.valider),
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

import 'package:base_de_projet/application/auth/sign_in_form_notifier.dart';
import 'package:base_de_projet/presentation/auth/widget/flushbar_auth_failure.dart';
import 'package:base_de_projet/presentation/components/spacing.dart';
import 'package:base_de_projet/presentation/core/router.gr.dart';
import 'package:base_de_projet/presentation/core/theme_button.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

class FormConnexionProvider extends StatelessWidget {
  const FormConnexionProvider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
        provider: signInFormNotifierProvider,
        onChange: (context, SignInFormData mySignInState) {
          mySignInState.authFailureOrSuccessOption.fold(
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
                      context.router.replaceAll([AuthCheckEmailRoute()]);
                    });
                  }));
        },
        child: FormConnexion());
  }
}

class FormConnexion extends ConsumerWidget {
  const FormConnexion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    watch(signInFormNotifierProvider);
    final env = context.read(environment).state.name;
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: Column(children: [
        const SizedBox(height: 8),
        if (env == Environment.dev)
          ElevatedButton(
            onPressed: () {
              context
                  .read(signInFormNotifierProvider.notifier)
                  .emailChanged("azer@yopmail.com");
              context
                  .read(signInFormNotifierProvider.notifier)
                  .passwordChanged("azerazer");
            },
            child: Text("Fill form"),
            style: buttonPrimaryHide,
          ),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            labelText: AppLocalizations.of(context)!.adresseemail,
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          autocorrect: false,
          onChanged: (value) {
            context
                .read(signInFormNotifierProvider.notifier)
                .emailChanged(value);
          },
          validator: (_) {
            final signIn = context.read(signInFormNotifierProvider);
            if (signIn.showErrorMessages) {
              return signIn.emailAddress.value.fold(
                (f) => f.maybeMap(
                  invalidEmail: (_) =>
                      AppLocalizations.of(context)!.emailinvalide,
                  orElse: () => null,
                ),
                (_) => null,
              );
            } else
              return null;
          },
        ),
        const SizedBox(height: 14),
        //MOT DE PASSE
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            labelText: AppLocalizations.of(context)!.motdepasse,
          ),
          autocorrect: false,
          obscureText: true,
          textInputAction: TextInputAction.done,
          onChanged: (value) => context
              .read(signInFormNotifierProvider.notifier)
              .passwordChanged(value),
          validator: (_) {
            final signIn = context.read(signInFormNotifierProvider);
            if (signIn.showErrorMessages) {
              return signIn.password.value.fold(
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
        //BARRE DE CHARGEMENT
        if (context.read(signInFormNotifierProvider).isSubmitting) ...[
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: null)
        ],
        const SpaceH10(),
        //MOT DE PASSE OUBLIE
        ElevatedButton(
          onPressed: () {
            context.router.push(AuthResetPasswordRoute());
          },
          child: Text(AppLocalizations.of(context)!.motdepasseoublie),
          style: buttonPrimaryHide,
        )
      ]),
    );
  }
}

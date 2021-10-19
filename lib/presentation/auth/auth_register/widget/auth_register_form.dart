import 'package:base_de_projet/application/auth/register_form_notifier.dart';
import 'package:base_de_projet/presentation/auth/widget/flushbar_auth_failure.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/presentation/core/router.gr.dart';

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
                      context.router.push(AuthCheckEmailRoute());
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
      child: ListView(
          padding: const EdgeInsets.all(18),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.nomutilisateur,
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
                      exceedingLenghtOrNull: (_) =>
                          AppLocalizations.of(context)!.nominvalide,
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
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.adresseemail,
              ),
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                context
                    .read(registerFormNotifierProvider.notifier)
                    .emailChanged(value);
              },
              autofillHints: [AutofillHints.email],
              validator: (_) {
                final registerData = context.read(registerFormNotifierProvider);
                if (registerData.showErrorMessages) {
                  return registerData.emailAddress.value.fold(
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
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.motdepasse,
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
            //MOT DE PASSE DE CONFIRMATION
            TextFormField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.motdepasseconfirmation,
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
                          AppLocalizations.of(context)!
                              .motdepasseconfirmationdifferent,
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
              child: Text(AppLocalizations.of(context)!.sinscrire),
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

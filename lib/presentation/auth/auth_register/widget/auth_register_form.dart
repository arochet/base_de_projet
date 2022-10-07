import 'package:base_de_projet/application/auth/register_form_notifier.dart';
import 'package:base_de_projet/presentation/auth/widget/flushbar_auth_failure.dart';
import 'package:base_de_projet/presentation/_components/contrained_box_max_width.dart';
import 'package:base_de_projet/presentation/_core/theme_button.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/presentation/_core/router.gr.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FormRegisterProvide extends ConsumerWidget {
  const FormRegisterProvide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<RegisterFormData>(registerFormNotifierProvider,
        (prev, myRegisterState) {
      myRegisterState.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
                //Message d'erreur
                FlushbarAuthFailure.show(context, failure);
              }, (_) {
                //Authentification réussie !
                Future.delayed(Duration.zero, () async {
                  ref.read(authNotifierProvider.notifier).authCheckRequested();
                  context.router.push(AuthCheckEmailRoute());
                });
              }));
    });
    return FormRegister();
  }
}

class FormRegister extends ConsumerWidget {
  const FormRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(registerFormNotifierProvider);
    return ContrainedBoxMaxWidth(
      center: kIsWeb,
      child: Form(
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
                  ref
                      .read(registerFormNotifierProvider.notifier)
                      .nomUtilisateurChanged(value);
                },
                validator: (_) {
                  final registerData = ref.read(registerFormNotifierProvider);

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
                  ref
                      .read(registerFormNotifierProvider.notifier)
                      .emailChanged(value);
                },
                autofillHints: [AutofillHints.email],
                validator: (_) {
                  final registerData = ref.read(registerFormNotifierProvider);
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
                onChanged: (value) => ref
                    .read(registerFormNotifierProvider.notifier)
                    .passwordChanged(value),
                validator: (_) {
                  final registerData = ref.read(registerFormNotifierProvider);
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
                  labelText:
                      AppLocalizations.of(context)!.motdepasseconfirmation,
                ),
                autocorrect: false,
                textInputAction: TextInputAction.done,
                obscureText: true,
                onChanged: (value) => ref
                    .read(registerFormNotifierProvider.notifier)
                    .passwordConfirmationChanged(value),
                validator: (_) {
                  final registerData = ref.read(registerFormNotifierProvider);
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
                  ref
                      .read(registerFormNotifierProvider.notifier)
                      .registerWithEmailAndPasswordPressed();
                },
                style: buttonBigPrimary,
                child: Text(AppLocalizations.of(context)!.sinscrire),
              ),
              const SizedBox(height: 12),
              if (ref.read(registerFormNotifierProvider).isSubmitting) ...[
                const SizedBox(height: 8),
                const LinearProgressIndicator(value: null)
              ]
            ]),
      ),
    );
  }
}

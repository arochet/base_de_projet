import 'package:another_flushbar/flushbar.dart';
import 'package:base_de_projet/application/account/new_password_form_notifier.dart';
import 'package:base_de_projet/presentation/components/contrained_box_max_width.dart';
import 'package:base_de_projet/presentation/components/main_scaffold.dart';
import 'package:base_de_projet/presentation/core/theme_button.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/presentation/core/router.gr.dart';

final mdpupdate = StateProvider<bool>((ref) => false);

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: ProviderListener(
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
                          serverError: (_) =>
                              AppLocalizations.of(context)!.problemedeserveur,
                        )).show(context);
                  }, (_) {
                    //Authentification réussie !
                    context.read(mdpupdate).state = true;
                    Future.delayed(Duration(seconds: 1), () {
                      context.read(mdpupdate).state = false;
                      context.router.replaceAll([
                        MainNavigationRoute(children: [AccountRoute()])
                      ]);
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
    final okmdpupdate = watch(mdpupdate).state;

    if (okmdpupdate)
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              AppLocalizations.of(context)!.motdepassemisajouravecsucces,
              style: Theme.of(context).textTheme.headline4),
        ),
      );

    return ContrainedBoxMaxWidth(
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: ListView(padding: const EdgeInsets.all(18), children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 0),
            child: Text(
              AppLocalizations.of(context)!.votrenouveaumotdepasse,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          const SizedBox(height: 14),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: AppLocalizations.of(context)!.motdepasse,
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
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: AppLocalizations.of(context)!.motdepasseconfirmation,
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
                        AppLocalizations.of(context)!
                            .motdepasseconfirmationdifferent,
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
                    .read(newPasswordFormNotifierProvider.notifier)
                    .newPasswordPressed();
              },
              style: buttonNormalPrimary,
              child: Text(AppLocalizations.of(context)!.valider),
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
      ),
    );
  }
}

import 'package:another_flushbar/flushbar.dart';
import 'package:base_de_projet/APPLICATION/account/reauthenticate_form_notifier.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/contrained_box_max_width.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/show_component_file.dart';
import 'package:base_de_projet/PRESENTATION/core/_core/theme_button.dart';
import 'package:base_de_projet/PRESENTATION/core/_core/theme_colors.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ReauthenticatePage extends ConsumerWidget {
  final PageRouteInfo<dynamic> route;
  const ReauthenticatePage({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<ReauthenticateFormData>(reauthenticateFormNotifierProvider, (prev, reauthenticateInState) {
      reauthenticateInState.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
                //Message d'erreur
                Flushbar(
                    duration: const Duration(seconds: 3),
                    icon: const Icon(Icons.warning),
                    messageColor: Colors.red,
                    message: failure.map(
                      serverError: (_) => AppLocalizations.of(context)!.problemedeserveur,
                      notAuthenticated: (_) => AppLocalizations.of(context)!.pasconnecte,
                      invalidCredential: (_) => 'Invalid-Credential',
                      invalidEmail: (_) => AppLocalizations.of(context)!.emailinvalide,
                      userMismatch: (_) => 'User Mismatch',
                      userNotFound: (_) => AppLocalizations.of(context)!.utilisateurpastrouver,
                      wrongPassword: (_) => AppLocalizations.of(context)!.motdepasseinvalid,
                      tooManyRequest: (_) => AppLocalizations.of(context)!.tropderequetes,
                    )).show(context);
              }, (_) {
                //Authentification réussie !
                Future.delayed(Duration.zero, () async {
                  // Navigator.pushReplacementNamed(context, args.route);
                  //Test
                  print("lance la route $route");
                  context.router.push(route);
                });
              }));
    });
    return MainScaffold(
      child: ShowComponentFile(
          title: 'account/reauthenticate/reauthenticate_page.dart', child: FormReauthenticate()),
    );
  }
}

class FormReauthenticate extends ConsumerWidget {
  const FormReauthenticate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(reauthenticateFormNotifierProvider);
    final isSubmitting = ref.watch(reauthenticateFormNotifierProvider).isSubmitting;
    return ContrainedBoxMaxWidth(
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: ListView(padding: const EdgeInsets.all(18), children: [
          const SizedBox(height: 8),
          //TEXT CONFIRMEZ VOTRE MOT DE PASSE
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
            onChanged: (value) =>
                ref.read(reauthenticateFormNotifierProvider.notifier).passwordChanged(value),
            validator: (_) {
              final data = ref.read(reauthenticateFormNotifierProvider);
              if (data.showErrorMessages) {
                return data.password.value.fold(
                  (f) => f.maybeMap(
                    shortPassword: (_) => AppLocalizations.of(context)!.motdepassetropcourt,
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
                ref
                    .read(reauthenticateFormNotifierProvider.notifier)
                    .reauthenticateWithEmailAndPasswordPressed();
              },
              style: buttonNormalPrimary,
              child: Text(AppLocalizations.of(context)!.valider),
            ),
          ),
          const SizedBox(height: 12),
          //BARRE DE CHARGEMENT
          if (isSubmitting) ...[const SizedBox(height: 8), const LinearProgressIndicator(value: null)],
          const SizedBox(height: 12),
        ]),
      ),
    );
  }
}

import 'package:base_de_projet/presentation/core/theme_button.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonConnexion extends ConsumerWidget {
  const ButtonConnexion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          ref
              .read(signInFormNotifierProvider.notifier)
              .signInWithEmailAndPasswordPressed();
        },
        style: buttonBigPrimary,
        child: Text(AppLocalizations.of(context)!.seconnecter),
      ),
    );
  }
}

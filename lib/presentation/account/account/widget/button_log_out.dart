import 'package:base_de_projet/PRESENTATION/core/utils/dev_utils.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonLogOut extends ConsumerWidget {
  const ButtonLogOut({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      child: ElevatedButton(
        onPressed: () {
          printDev();
          ref.read(authNotifierProvider.notifier).signOut();
        },
        child: Text(AppLocalizations.of(context)!.sedeconnecter),
      ),
    );
  }
}

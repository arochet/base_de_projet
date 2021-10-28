import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainHomeTitleWeb extends StatelessWidget {
  const MainHomeTitleWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Center(
        child: Text(AppLocalizations.of(context)!.nomprojet,
            style: Theme.of(context).textTheme.headline3),
      ),
    );
  }
}

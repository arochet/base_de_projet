import 'package:base_de_projet/domain/auth/value_objects.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/presentation/core/router.gr.dart';

class DeleteAccountPage extends ConsumerStatefulWidget {
  const DeleteAccountPage({Key? key}) : super(key: key);

  @override
  _DeleteAccountPageState createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends ConsumerState<DeleteAccountPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      //Supprime le compte et redirige vers authInit
      ref
          .read(authNotifierProvider.notifier)
          .deleteAccount(TypeAccountState.email)
          .then((value) => context.router.push(AuthInitRoute()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(AppLocalizations.of(context)!.verificationemail),
          ],
        ),
      ),
    );
  }
}

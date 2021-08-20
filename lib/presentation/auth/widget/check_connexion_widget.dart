import 'package:base_de_projet/application/auth/auth_notifier.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckConnexionWidget extends StatefulWidget {
  final Widget child;
  const CheckConnexionWidget({Key? key, required this.child}) : super(key: key);

  @override
  _CheckConnexionWidgetState createState() => _CheckConnexionWidgetState();
}

class _CheckConnexionWidgetState extends State<CheckConnexionWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => getOut(context.read(authNotifierProvider)));
  }

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      provider: authNotifierProvider,
      onChange: (context, AuthState myAuthState) => getOut(myAuthState),
      child: widget.child,
    );
  }

  getOut(state) {
    if (!(state is AuthAuthenticated)) {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, AppRouter.authInit);
      });
    }
  }
}

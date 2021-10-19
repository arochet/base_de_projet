import 'package:base_de_projet/application/auth/auth_notifier.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/presentation/core/router.gr.dart';

class CheckUserConnected extends StatefulWidget {
  final Widget child;
  const CheckUserConnected({Key? key, required this.child}) : super(key: key);

  @override
  _CheckUserConnectedState createState() => _CheckUserConnectedState();
}

class _CheckUserConnectedState extends State<CheckUserConnected> {
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
        context.router.replaceAll([AuthInitRoute()]);
      });
    }
  }
}

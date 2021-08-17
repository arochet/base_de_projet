import 'package:flutter/material.dart';
import 'package:base_de_projet/presentation/auth/sign_in/widget/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign In"),
        ),
        body: const SignInForm());
  }
}

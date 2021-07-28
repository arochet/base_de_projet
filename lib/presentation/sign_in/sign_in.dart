import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_de_projet/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:base_de_projet/injection.dart';
import 'package:base_de_projet/presentation/sign_in/widget/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign In"),
        ),
        body: BlocProvider(
          create: (context) => getIt<SignInFormBloc>(),
          child: const SignInForm(),
        ));
  }
}

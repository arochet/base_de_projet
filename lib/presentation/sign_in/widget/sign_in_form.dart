import 'package:another_flushbar/flushbar.dart';
import 'package:base_de_projet/application/auth/auth_notifier.dart';
import 'package:base_de_projet/application/auth/sign_in_form_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:base_de_projet/providers.dart';

class SignInForm extends ConsumerWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final signInState = watch(signInFormNotifierProvider);
    //final authState = watch(authNotifierProvider);
    print("Presentation/SignInForm => rebuild formulaire sign in");

    signInState.authFailureOrSuccessOption.fold(
        () {},
        (either) => either.fold((failure) {
              Flushbar(
                      duration: const Duration(seconds: 3),
                      icon: const Icon(Icons.warning),
                      messageColor: Colors.red,
                      message: failure.map(
                          cancelledByUser: (_) => 'Cancelled',
                          serverError: (_) => 'Server Error',
                          emailAlreadyInUse: (_) => 'Email already in use',
                          invalidEmailAndPasswordCombination: (_) =>
                              'Invalid email and password conbination'))
                  .show(context);
            }, (_) {
              //print("authState $authState");
              print("Presentation/SignInForm => authFailureOrSuccessOption");
              Future.delayed(Duration.zero, () async {
                context
                    .read(authNotifierProvider.notifier)
                    .authCheckRequested();
                Navigator.pushReplacementNamed(context, '/home');
              });
            }));

    return FormSignIn(signInState: signInState);
  }
}

class FormSignIn extends StatelessWidget {
  const FormSignIn({
    Key? key,
    required this.signInState,
  }) : super(key: key);

  final SignInFormData signInState;

  @override
  Widget build(BuildContext context /* , ScopedReader watch */) {
    //final signInForm = watch(signInFormNotifierProvider.notifier);

    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: ListView(padding: const EdgeInsets.all(8), children: [
        const Text(
          '📝',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 130),
        ),
        const SizedBox(height: 8),
        TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'Email',
            ),
            autocorrect: false,
            onChanged: (value) {
              context
                  .read(signInFormNotifierProvider.notifier)
                  .emailChanged(value);
            },
            validator: (_) {
              if (signInState.showErrorMessages) {
                return signInState.emailAddress.value.fold(
                  (f) => f.maybeMap(
                    invalidEmail: (_) => 'Invalid Email',
                    orElse: () => null,
                  ),
                  (_) => null,
                );
              } else
                return null;
            }),
        const SizedBox(height: 8),
        TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: 'Password',
            ),
            autocorrect: false,
            obscureText: true,
            onChanged: (value) => context
                .read(signInFormNotifierProvider.notifier)
                .passwordChanged(value),
            validator: (_) {
              if (signInState.showErrorMessages) {
                return signInState.password.value.fold(
                  (f) => f.maybeMap(
                    shortPassword: (_) => 'Short Password',
                    orElse: () => null,
                  ),
                  (_) => null,
                );
              } else
                return null;
            }),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read(signInFormNotifierProvider.notifier)
                      .signInWithEmailAndPasswordPressed();
                },
                child: const Text('SIGN IN'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read(signInFormNotifierProvider.notifier)
                      .registerWithEmailAndPasswordPressed();
                },
                child: const Text('REGISTER'),
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            context
                .read(signInFormNotifierProvider.notifier)
                .signInWithGooglePressed();
          },
          child: const Text(
            'SIGN IN WITH GOOGLE',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (signInState.isSubmitting) ...[
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: null)
        ]
      ]),
    );
  }
}

import 'package:another_flushbar/flushbar.dart';
import 'package:base_de_projet/application/auth/sign_in_form_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:base_de_projet/providers.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Presentation/SignInForm => rebuild formulaire");

    return ProviderListener(
      provider: signInFormNotifierProvider,
      onChange: (context, SignInFormData mySignInState) {
        print("change signInFormNotifierProvider");
        //TO DO => Code sale !!
        mySignInState.authFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold((failure) {
                  print("Presentation/SignInForm => Flushbar $failure");
                  //Message d'erreur
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
                  print(
                      "Presentation/SignInForm => authFailureOrSuccessOption");
                  //Authentification réussie !
                  Future.delayed(Duration.zero, () async {
                    context
                        .read(authNotifierProvider.notifier)
                        .authCheckRequested();
                    Navigator.pushReplacementNamed(context, '/home');
                  });
                }));
      },
      child: FormSignIn(),
    );
  }
}

//Formulaire pour la connexion / inscription
class FormSignIn extends ConsumerWidget {
  const FormSignIn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    watch(signInFormNotifierProvider);
    print("build form");
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
              final signIn = context.read(signInFormNotifierProvider);
              if (signIn.showErrorMessages) {
                return signIn.emailAddress.value.fold(
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
              final signIn = context.read(signInFormNotifierProvider);
              if (signIn.showErrorMessages) {
                return signIn.password.value.fold(
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
        if (context.read(signInFormNotifierProvider).isSubmitting) ...[
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: null)
        ]
      ]),
    );
  }
}

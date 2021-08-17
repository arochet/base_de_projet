import 'package:another_flushbar/flushbar.dart';
import 'package:base_de_projet/application/auth/sign_in_form_notifier.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormConnexionProvide extends StatelessWidget {
  const FormConnexionProvide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
        provider: signInFormNotifierProvider,
        onChange: (context, SignInFormData mySignInState) {
          mySignInState.authFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold((failure) {
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
                                'Invalid email and password conbination')).show(
                        context);
                  }, (_) {
                    //Authentification réussie !
                    Future.delayed(Duration.zero, () async {
                      context
                          .read(authNotifierProvider.notifier)
                          .authCheckRequested();
                      Navigator.pushReplacementNamed(context, '/home');
                    });
                  }));
        },
        child: FormConnexion());
  }
}

class FormConnexion extends ConsumerWidget {
  const FormConnexion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    watch(signInFormNotifierProvider);
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: ListView(padding: const EdgeInsets.all(18), children: [
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
          },
        ),
        const SizedBox(height: 14),
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
          },
        ),
        const SizedBox(height: 8),
        if (context.read(signInFormNotifierProvider).isSubmitting) ...[
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: null)
        ]
      ]),
    );
  }
}

import 'package:another_flushbar/flushbar.dart';
import 'package:base_de_projet/domain/auth/auth_failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlushbarAuthFailure {
  static show(context, AuthFailure failure) => Flushbar(
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.warning),
      messageColor: Colors.red,
      message: failure.map(
        cancelledByUser: (_) => 'Annulé',
        serverError: (_) => 'Server Error',
        emailAlreadyInUse: (_) => 'Adresse email déjà utilisé',
        insufficientPermission: (_) => 'Permission insuffisante',
        invalidPassword: (_) => 'Mot de passe invalide',
        invalidUser: (_) => 'Identifiant non trouvé',
        tooManyRequest: (_) => 'Trop de requête. Ressayez plus tard.',
      )).show(context);
}

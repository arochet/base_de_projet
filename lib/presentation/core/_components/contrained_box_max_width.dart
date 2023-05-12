import 'package:flutter/material.dart';

/// Affiche une page avec une largeur maximale de 400
/// Utile pour les pages de connexion, d'inscription, de reset de mot de passe pour les écrans larges
class ContrainedBoxMaxWidth extends StatelessWidget {
  const ContrainedBoxMaxWidth({Key? key, required this.child, this.center = true}) : super(key: key);
  final Widget child;
  final bool center;

  @override
  Widget build(BuildContext context) {
    if (center)
      return Center(
          child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 400,
        ),
        child: child,
      ));
    else
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 400,
        ),
        child: child,
      );
  }
}

import 'package:flutter/material.dart';

class ContrainedBoxMaxWidth extends StatelessWidget {
  const ContrainedBoxMaxWidth({Key? key, required this.child, this.center = true}) : super(key: key);
  final Widget child;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return center
        ? Center(
            child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: child,
          ))
        : ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: child,
          );
  }
}

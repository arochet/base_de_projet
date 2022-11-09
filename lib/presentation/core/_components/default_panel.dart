import 'package:base_de_projet/presentation/core/_core/theme_colors.dart';
import 'package:flutter/material.dart';

class DefaultPanel extends StatelessWidget {
  const DefaultPanel({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: colorpanel(800),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
        child: child,
      ),
    );
  }
}

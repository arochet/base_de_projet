import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String message;
  AppError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error_outline, color: Theme.of(context).colorScheme.error, size: 18),
        SizedBox(width: 5),
        Text(message, style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }
}

import 'package:admin/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppTest extends ConsumerWidget {
  const AppTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(userRepositoryProvider).test();
      },
      child: const Text("TEST"),
    );
  }
}

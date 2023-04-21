import 'package:admin/providers.dart';
import 'package:base_de_projet/DOMAIN/auth/user_data.dart';
import 'package:base_de_projet/INFRASTRUCTURE/auth/user_data_dtos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppTest extends ConsumerWidget {
  const AppTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(userRepositoryProvider).test();
      },
      child: Text("TEST"),
    );
  }
}

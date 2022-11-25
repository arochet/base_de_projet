import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShowComponentFile extends ConsumerWidget {
  final Widget child;
  final String title;
  const ShowComponentFile({required this.title, required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool displayPath = ref.watch(showFilePath);
    return Column(
      children: [
        if (displayPath) Text(title, style: Theme.of(context).textTheme.bodyText1),
        Expanded(child: child),
      ],
    );
  }
}

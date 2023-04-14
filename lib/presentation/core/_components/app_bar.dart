import 'package:base_de_projet/PRESENTATION/core/_core/theme_colors.dart';
import 'package:base_de_projet/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

AppBar? buildAppBar(BuildContext context, WidgetRef ref, String? title) {
  final env = ref.watch(environment.notifier).state.name;
  return AppBar(
    toolbarHeight: 55,
    backgroundColor: colorpanel(700),
    shadowColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: colorpanel(50),
      size: 30,
    ),
    title: title != null ? Text(title, style: Theme.of(context).textTheme.titleLarge) : null,
    actions: env == Environment.dev
        ? [
            InkWell(
              onTap: () {
                printDev();
                final notifier = ref.read(showFilePath.notifier);
                notifier.state = !ref.read(showFilePath);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.remove_red_eye, size: 25),
              ),
            ),
          ]
        : null,
  );
}

import 'package:base_de_projet/PRESENTATION/core/_core/app_widget.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Ce component sert a afficher en mode développeur le chemin de la page en cour ou le nom du widget
//Cela permet de s'y retrouver plus rapidement dans le projet

class ShowComponentFile extends ConsumerWidget {
  final Widget child;
  final String? title;
  const ShowComponentFile({required this.child, this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool displayPath = ref.watch(showFilePath);
    final Color color = Colors.amber;

    if (title != null && displayPath) {
      return Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                border: Border.all(color: color, width: 1),
              ),
              child: child),
          Center(
              heightFactor: 1,
              child: Container(
                color: color,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(title!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black)),
                ),
              )),
        ],
      );
    }

    return child;
  }
}

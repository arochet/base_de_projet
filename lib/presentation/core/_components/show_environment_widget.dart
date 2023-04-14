import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

class ShowEnvironment extends ConsumerWidget {
  final Widget child;
  const ShowEnvironment({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final env = ref.watch(environment.notifier).state.name;
    String txtEnv = "";
    if (env == Environment.dev)
      txtEnv = "Environnement de développement";
    else if (env == Environment.test) txtEnv = "Environnent de test";

    return Column(
      children: [
        if (env != Environment.prod)
          Container(
            color: Colors.grey,
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(txtEnv, style: Theme.of(context).textTheme.headline5),
                  ),
                ),
                /* InkWell(
                  child: Icon(Icons.remove_red_eye),
                  onTap: () {
                    //File Path Notifier
                    final notifier = ref.read(showFilePath.notifier);
                    notifier.state = !ref.read(showFilePath);
                  },
                ), 
                SizedBox(width: 5),*/
              ],
            ),
          ),
        Expanded(child: child),
      ],
    );
  }
}

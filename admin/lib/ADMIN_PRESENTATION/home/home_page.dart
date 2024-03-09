import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:base_de_projet/PRESENTATION/core/components/show_component_file.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ShowComponentFile(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(child: Text('HOME')),
      ),
    );
  }
}

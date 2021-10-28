import 'package:base_de_projet/presentation/core/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

/* get defaultAppBar => kIsWeb
    ? AppBar(
        toolbarHeight: 70,
        backgroundColor: colorpanel(700),
        shadowColor: Colors.transparent,
      )
    : AppBar(
        toolbarHeight: 70,
        backgroundColor: colorpanel(700),
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: colorpanel(50),
          size: 65,
        ),
      ); */

final defaultAppBar = AppBar(
  toolbarHeight: 70,
  backgroundColor: colorpanel(700),
  shadowColor: Colors.transparent,
  iconTheme: IconThemeData(
    color: colorpanel(50),
    size: 65,
  ),
);

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    toolbarHeight: 70,
    backgroundColor: colorpanel(700),
    shadowColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: colorpanel(50),
      size: 65,
    ),
    title: Text(title, style: Theme.of(context).textTheme.headline4),
  );
}

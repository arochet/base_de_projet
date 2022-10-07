import 'package:base_de_projet/presentation/_core/theme_colors.dart';
import 'package:flutter/material.dart';

final defaultAppBar = AppBar(
  toolbarHeight: 70,
  backgroundColor: colorpanel(700),
  shadowColor: Colors.transparent,
  iconTheme: IconThemeData(
    color: colorpanel(50),
    size: 65,
  ),
);

AppBar? buildAppBar(BuildContext context, String title) {
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

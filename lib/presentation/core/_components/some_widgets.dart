import 'package:base_de_projet/PRESENTATION/core/_core/theme_colors.dart';
import 'package:flutter/material.dart';

AppBar? buildAppBar(BuildContext context, String? title) {
  return AppBar(
    toolbarHeight: 70,
    backgroundColor: colorpanel(700),
    shadowColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: colorpanel(50),
      size: 35,
    ),
    title: title != null ? Text(title, style: Theme.of(context).textTheme.headline4) : null,
  );
}
import 'package:base_de_projet/presentation/core/theme_colors.dart';
import 'package:flutter/material.dart';

final buttonPrimaryBig = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
    visualDensity: VisualDensity(
      horizontal: (VisualDensity.maximumDensity - 1.0),
      vertical: (VisualDensity.maximumDensity - 2.0),
    ),
    minimumSize: Size(double.infinity, 30),
    primary: maincolor[5],
    onPrimary: Colors.white,
    onSurface: Colors.grey,
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0))));

final buttonRedBig = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
    visualDensity: VisualDensity(
      horizontal: (VisualDensity.maximumDensity - 1.0),
      vertical: (VisualDensity.maximumDensity - 2.0),
    ),
    minimumSize: Size(double.infinity, 30),
    primary: Color.fromARGB(255, 233, 20, 20),
    onPrimary: Colors.white,
    onSurface: Colors.grey,
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0))));

final buttonSecondaryBig = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
    visualDensity: VisualDensity(
      horizontal: (VisualDensity.maximumDensity - 1.0),
      vertical: (VisualDensity.maximumDensity - 4.0),
    ),
    minimumSize: Size(double.infinity, 30),
    primary: Color.fromARGB(255, 255, 255, 255),
    onPrimary: Colors.black,
    onSurface: Colors.grey,
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0))));

final buttonPrimaryNormal = ElevatedButton.styleFrom(
  textStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
  primary: maincolor[5],
  onPrimary: Colors.white,
  onSurface: Colors.grey,
  elevation: 0,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0))),
);

final buttonPrimaryHide = ElevatedButton.styleFrom(
  textStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
  primary: Colors.transparent,
  onPrimary: Colors.black54,
  elevation: 0,
);

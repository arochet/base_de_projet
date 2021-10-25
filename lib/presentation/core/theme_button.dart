import 'package:base_de_projet/presentation/core/theme_colors.dart';
import 'package:flutter/material.dart';

ButtonStyle buttonBig(Color color, bool isWhite) => ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
    visualDensity: VisualDensity(
      horizontal: (VisualDensity.maximumDensity - 1.0),
      vertical: (VisualDensity.maximumDensity - 2.0),
    ),
    minimumSize: Size(double.infinity, 30),
    primary: color,
    onPrimary: isWhite ? Colors.white : colorpanel(900),
    onSurface: Colors.grey,
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0))));

final buttonBigPrimary = buttonBig(actioncolor["primary"]!, false);
final buttonBigSecondary = buttonBig(actioncolor["secondary"]!, false);
final buttonBigConfirm = buttonBig(actioncolor["confirm"]!, false);
final buttonBigWarning = buttonBig(actioncolor["warning"]!, true);
final buttonBigRemove = buttonBig(actioncolor["remove"]!, true);
final buttonBigHelp = buttonBig(actioncolor["help"]!, true);

ButtonStyle buttonNormal(Color color, bool isWhite) => ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      primary: color,
      onPrimary: isWhite ? Colors.white : Colors.black,
      onSurface: Colors.grey,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))),
    );

final buttonNormalPrimary = buttonNormal(actioncolor["primary"]!, false);
final buttonNormalSecondary = buttonNormal(actioncolor["secondary"]!, false);
final buttonNormalConfirm = buttonNormal(actioncolor["confirm"]!, false);
final buttonNormalWarning = buttonNormal(actioncolor["warning"]!, true);
final buttonNormalRemove = buttonNormal(actioncolor["remove"]!, true);
final buttonNormalHelp = buttonNormal(actioncolor["help"]!, true);

final buttonPrimaryHide = ElevatedButton.styleFrom(
  textStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
  primary: Colors.transparent,
  onPrimary: colorpanel(200),
  elevation: 0,
);

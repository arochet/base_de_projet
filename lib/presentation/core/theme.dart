import 'package:flutter/material.dart';

final buttonPrimaryBig = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
    visualDensity: VisualDensity(
      horizontal: (VisualDensity.maximumDensity - 1.0),
      vertical: (VisualDensity.maximumDensity - 2.0),
    ),
    minimumSize: Size(double.infinity, 30),
    primary: Color.fromARGB(255, 85, 129, 87),
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
  primary: Color.fromARGB(255, 85, 129, 87),
  onPrimary: Colors.white,
  onSurface: Colors.grey,
  elevation: 0,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0))),
);

Color backgroundColor = Color.fromRGBO(239, 239, 239, 1);

class BackgroundRoundPaint extends CustomPainter {
  final double widthScreen;
  BackgroundRoundPaint(this.widthScreen);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 230, 230, 230)
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;
    canvas.drawCircle(Offset(0, -widthScreen + 100), widthScreen, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

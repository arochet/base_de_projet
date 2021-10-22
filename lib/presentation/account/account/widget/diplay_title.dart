import 'package:flutter/material.dart';

class DisplayTitle extends StatelessWidget {
  final String title;
  const DisplayTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: Text(title, style: Theme.of(context).textTheme.headline3),
    );
  }
}

import 'package:flutter/material.dart';

class CardShowInfo extends StatelessWidget {
  final String title;
  final String body;
  const CardShowInfo({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.caption),
                SizedBox(height: 2),
                Text(body, style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          )),
    );
  }
}

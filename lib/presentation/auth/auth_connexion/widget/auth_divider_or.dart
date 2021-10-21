import 'package:flutter/material.dart';

class DividerOR extends StatelessWidget {
  const DividerOR({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(children: <Widget>[
        Expanded(child: Divider()),
        SizedBox(width: 10),
        Text("OR"),
        SizedBox(width: 10),
        Expanded(child: Divider()),
      ]),
    );
  }
}

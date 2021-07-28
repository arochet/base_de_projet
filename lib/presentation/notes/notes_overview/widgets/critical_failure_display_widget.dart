import 'package:flutter/material.dart';
import 'package:base_de_projet/domain/notes/note_failures.dart';

class CriticalFailureDisplay extends StatelessWidget {
  final NoteFailure failure;

  const CriticalFailureDisplay({Key? key, required this.failure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Wahh', style: TextStyle(fontSize: 100)),
          Text(
            failure.maybeMap(
                insufficientPermission: (_) => "Insufficient permissions",
                orElse: () => 'Unexpected error. \n Please, contact support.'),
          ),
          ElevatedButton(
              onPressed: () {
                print("send email");
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(Icons.mail),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text('I NEED HELP')
                ],
              ))
        ],
      ),
    );
  }
}

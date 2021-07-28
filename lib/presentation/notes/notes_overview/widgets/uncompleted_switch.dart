import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:base_de_projet/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UncompletedSwitch extends HookWidget {
  const UncompletedSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final toggleState = useState(false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkResponse(
        onTap: () {
          toggleState.value = !toggleState.value;
          context.read<NoteWatcherBloc>().add(toggleState.value
              ? const NoteWatcherEvent.watchUncompletedStarted()
              : const NoteWatcherEvent.watchAllStarted());
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          child: toggleState.value
              ? Icon(
                  Icons.check_box_outline_blank,
                  key: const Key('outline'),
                )
              : Icon(Icons.indeterminate_check_box,
                  key: const Key('indeterminate')),
        ),
      ),
    );
  }
}

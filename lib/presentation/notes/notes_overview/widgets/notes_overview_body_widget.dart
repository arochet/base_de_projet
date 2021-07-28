import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_de_projet/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:base_de_projet/presentation/notes/notes_overview/widgets/critical_failure_display_widget.dart';
import 'package:base_de_projet/presentation/notes/notes_overview/widgets/error_note_card_widget.dart';

import 'note_card_widget.dart';

class NotesOverviewBody extends StatelessWidget {
  const NotesOverviewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteWatcherBloc, NoteWatcherState>(
        builder: (context, state) {
      return state.map(
        initial: (_) => Container(),
        loadInProgress: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
        loadSuccess: (state) {
          if (state.notes.size == 0) {
            return const Center(
              child: Text("Pas de notes"),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final note = state.notes[index];
              if (note.failureOption.isSome()) {
                return ErrorNoteCard(note: note);
              } else {
                return NoteCard(note: note);
              }
            },
            itemCount: state.notes.size,
          );
        },
        loadFailure: (state) {
          return CriticalFailureDisplay(failure: state.noteFailure);
        },
      );
    });
  }
}

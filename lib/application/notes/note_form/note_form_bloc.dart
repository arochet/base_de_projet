import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:base_de_projet/domain/notes/i_note_repository.dart';
import 'package:base_de_projet/domain/notes/note.dart';
import 'package:base_de_projet/domain/notes/note_failures.dart';
import 'package:base_de_projet/domain/notes/value_objects.dart';
import 'package:base_de_projet/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';

part 'note_form_event.dart';
part 'note_form_state.dart';
part 'note_form_bloc.freezed.dart';

@injectable
class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  final INoteRepository _noteRepository;

  NoteFormBloc(this._noteRepository) : super(NoteFormState.initial());

  @override
  NoteFormState get initialState => NoteFormState.initial();

  @override
  Stream<NoteFormState> mapEventToState(
    NoteFormEvent event,
  ) async* {
    yield* event.map(
      initialized: (e) async* {
        yield e.initialNoteOption.fold(
            () => state,
            (initalNote) => state.copyWith(
                  note: initalNote,
                  isEditing: true,
                ));
      },
      bodyChanged: (e) async* {
        yield state.copyWith(
            note: state.note.copyWith(body: NoteBody(e.bodyStr)),
            saveFailureOrSuccessOption: none());
      },
      colorChanged: (e) async* {
        yield state.copyWith(
            note: state.note.copyWith(color: NoteColor(e.color)),
            saveFailureOrSuccessOption: none());
      },
      todosChanged: (e) async* {
        yield state.copyWith(
            note: state.note.copyWith(
                todos: List3(e.todos.map((primitive) => primitive.toDomain()))),
            saveFailureOrSuccessOption: none());
      },
      saved: (e) async* {
        Either<NoteFailure, Unit>? failureOrSuccess;

        yield state.copyWith(
          isSaving: true,
          saveFailureOrSuccessOption: none(),
        );

        if (state.note.failureOption.isNone()) {
          failureOrSuccess = state.isEditing
              ? await _noteRepository.update(state.note)
              : await _noteRepository.create(state.note);
        }

        yield state.copyWith(
          isSaving: false,
          showErrorMessages: true,
          saveFailureOrSuccessOption: optionOf(failureOrSuccess),
        );
      },
    );
  }
}

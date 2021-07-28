import 'package:another_flushbar/flushbar_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:base_de_projet/application/notes/note_form/note_form_bloc.dart';
import 'package:base_de_projet/domain/notes/note.dart';
import 'package:base_de_projet/injection.dart';
import 'package:base_de_projet/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:base_de_projet/presentation/notes/note_form/widgets/add_todo_tile_widget.dart';
import 'package:base_de_projet/presentation/notes/note_form/widgets/body_field_widget.dart';
import 'package:base_de_projet/presentation/notes/note_form/widgets/color_field_widget.dart';
import 'package:base_de_projet/presentation/notes/note_form/widgets/todo_list_widget.dart';

class NoteFormArguments {
  final Note? editedNote;

  NoteFormArguments(this.editedNote);
}

class NoteFormPage extends StatelessWidget {
  const NoteFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoteFormArguments? args = null;
    Note? editedNote = null;

    if (ModalRoute.of(context)!.settings.arguments != null) {
      args = ModalRoute.of(context)!.settings.arguments as NoteFormArguments;
      editedNote = args.editedNote;
    }

    return BlocProvider(
      create: (context) => getIt<NoteFormBloc>()
        ..add(NoteFormEvent.initialized(optionOf(editedNote))),
      child: BlocConsumer<NoteFormBloc, NoteFormState>(
          listenWhen: (p, c) =>
              p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption,
          listener: (context, state) {
            state.saveFailureOrSuccessOption.fold(
              () => {},
              (either) {
                either.fold((failure) {
                  FlushbarHelper.createError(
                      message: failure.map(
                    insufficientPermission: (_) => 'Insufficient permissions ❌',
                    unableToUpdate: (_) =>
                        "Couldn't update the note. Was it deleted from another device?",
                    unexpected: (_) =>
                        'Unexpected error occured, please contact support.',
                  )).show(context);
                }, (_) {
                  Navigator.popUntil(
                      context, ModalRoute.withName('/note-overview'));
                });
              },
            );
          },
          buildWhen: (p, c) => p.isSaving != c.isSaving,
          builder: (context, state) {
            return Stack(
              children: <Widget>[
                const NoteFormPageScaffold(),
                SavingInProgressOverlay(
                  isSaving: state.isSaving,
                )
              ],
            );
          }),
    );
  }
}

class SavingInProgressOverlay extends StatelessWidget {
  final bool isSaving;

  const SavingInProgressOverlay({
    Key? key,
    required this.isSaving,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
        ignoring: !isSaving,
        child: AnimatedContainer(
          color: isSaving ? Colors.black.withOpacity(0.8) : Colors.transparent,
          duration: const Duration(milliseconds: 150),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Visibility(
            visible: isSaving,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 8),
              Text("Saving",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                      )),
            ]),
          ),
        ));
  }
}

class NoteFormPageScaffold extends StatelessWidget {
  const NoteFormPageScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NoteFormBloc, NoteFormState>(
          buildWhen: (p, c) => p.isEditing == p.isEditing,
          builder: (context, state) {
            return Text(state.isEditing ? 'Edit a note' : 'Create a note');
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              context.read<NoteFormBloc>().add(const NoteFormEvent.saved());
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: BlocBuilder<NoteFormBloc, NoteFormState>(
        buildWhen: (p, c) => p.showErrorMessages != c.showErrorMessages,
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (_) => FormTodos(),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const BodyField(),
                    const ColorField(),
                    const AddTodoTile(),
                    const TodoList(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

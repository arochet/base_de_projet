import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:base_de_projet/domain/notes/note.dart';
import 'package:base_de_projet/domain/notes/note_failures.dart';

abstract class INoteRepository {
  //Watch notes
  //Wacth uncompleted notes
  //CUD

  //C Read UD (Create Updtate Delete)

  Stream<Either<NoteFailure, KtList<Note>>> watchAll();
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted();
  Future<Either<NoteFailure, Unit>> create(Note note); //Unit means void
  Future<Either<NoteFailure, Unit>> update(Note note); //Unit means void
  Future<Either<NoteFailure, Unit>> delete(Note note); //Unit means void
}

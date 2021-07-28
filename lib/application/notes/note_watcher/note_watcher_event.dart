part of 'note_watcher_bloc.dart';

@freezed
class NoteWatcherEvent with _$NoteWatcherEvent {
  const factory NoteWatcherEvent.watchAllStarted() = _WatchAllStarted;
  const factory NoteWatcherEvent.watchUncompletedStarted() =
      _WatchUncompletedStarted;
  const factory NoteWatcherEvent.notesReveived(
      Either<NoteFailure, KtList<Note>> failureOrNotes) = _NotesReveived;
}

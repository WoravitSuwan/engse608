import 'package:flutter/material.dart';
import '../../data/models/note.dart';
import '../../data/repositories/note_repository.dart';

class NoteStore extends ChangeNotifier {
  NoteStore(this._repo);

  final NoteRepository _repo;

  List<Note> _notes = [];
  List<Note> get notes => _notes;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> loadNotes() async {
    _loading = true;
    notifyListeners();

    _notes = await _repo.getAllNotes();

    _loading = false;
    notifyListeners();
  }

  Future<void> addNote({
    required String title,
    required String content,
  }) async {
    final now = DateTime.now();

    final note = Note(
      title: title,
      content: content,
      createdAt: now,
      updatedAt: now,
    );

    await _repo.insertNote(note);
    await loadNotes();
  }

  Future<void> editNote({
    required int id,
    required String title,
    required String content,
  }) async {
    final existing = await _repo.getAllNotes();
    final oldNote = existing.firstWhere((n) => n.id == id);

    final updated = oldNote.copyWith(
      title: title,
      content: content,
      updatedAt: DateTime.now(),
    );

    await _repo.updateNote(updated);
    await loadNotes();
  }

  Future<void> removeNote(int id) async {
    await _repo.deleteNote(id);
    await loadNotes();
  }
}
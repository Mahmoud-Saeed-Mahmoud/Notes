import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_flutter/models/note.dart';

class NoteDB with ChangeNotifier {
  addNote(Note note) async {
    var box = await Hive.openBox<Note>('note');
    box.add(note);
    notifyListeners();
  }

  List _noteList = <Note>[];
  List get noteList => _noteList;

  queryNotes() async {
    final box = await Hive.openBox<Note>('note');

    _noteList = box.values.toList();

    notifyListeners();
  }

  updateNote(int index, Note note) async {
    final box = await Hive.openBox<Note>('note');

    box.putAt(index, note);

    notifyListeners();
  }

  deletNote(int index) async {
    final box = await Hive.openBox<Note>('note');

    box.deleteAt(index);

    queryNotes();

    notifyListeners();
  }

  deletAllNotes() async {
    final box = await Hive.openBox<Note>('note');

    box.deleteFromDisk();
  }
}

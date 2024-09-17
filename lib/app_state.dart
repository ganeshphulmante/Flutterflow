import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isDarkMode = prefs.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
    _safeInit(() {
      _notes = prefs
              .getStringList('ff_notes')
              ?.map((x) {
                try {
                  return NoteStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _notes;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    prefs.setBool('ff_isDarkMode', value);
  }

  List<NoteStruct> _notes = [];
  List<NoteStruct> get notes => _notes;
  set notes(List<NoteStruct> value) {
    _notes = value;
    prefs.setStringList('ff_notes', value.map((x) => x.serialize()).toList());
  }

  void addToNotes(NoteStruct value) {
    notes.add(value);
    prefs.setStringList('ff_notes', _notes.map((x) => x.serialize()).toList());
  }

  void removeFromNotes(NoteStruct value) {
    notes.remove(value);
    prefs.setStringList('ff_notes', _notes.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromNotes(int index) {
    notes.removeAt(index);
    prefs.setStringList('ff_notes', _notes.map((x) => x.serialize()).toList());
  }

  void updateNotesAtIndex(
    int index,
    NoteStruct Function(NoteStruct) updateFn,
  ) {
    notes[index] = updateFn(_notes[index]);
    prefs.setStringList('ff_notes', _notes.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInNotes(int index, NoteStruct value) {
    notes.insert(index, value);
    prefs.setStringList('ff_notes', _notes.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

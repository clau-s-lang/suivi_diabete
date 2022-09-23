import 'package:flutter/material.dart';
import 'package:gestion_diabete/database/dbNote.dart';
import '../modeles/modelNote.dart';

class AjoutNote extends StatefulWidget {
  final Note? note;

  const AjoutNote({
    Key? key,
    this.note,
}):super(key: key);

  @override
  _AjoutNoteState createState() => _AjoutNoteState();
}

class _AjoutNoteState extends State<AjoutNote> {
  final _formKey = GlobalKey<FormState>();
  late bool isImportant;
  late int number;
  late String title;
  late String description;
  @override
  Widget build(BuildContext context) => Scaffold();

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if(isValid) {
      final isUpdating = widget.note != null;

      if(isUpdating) {
        await updateNote();
      } else{
        await addNote();
      }
      Navigator.of(context).pop;
    }
  }

  Future updateNote() async {
    final note = widget.note!.copy(
      isImportant: isImportant,
      number: number,
      title: title,
      description: description,
    );
    await NotesDatabase.instance.update(note);
  }

  Future addNote() async{
    final note = Note(
      title: title,
      isImportant: true,
      number: number,
      description: description,
      createdTime: DateTime.now(),
    );
    await NotesDatabase.instance.create(note);
  }
}



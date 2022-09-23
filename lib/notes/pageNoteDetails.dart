import 'package:flutter/material.dart';
import 'package:gestion_diabete/database/dbNote.dart';
import '../notes/pageAjoutNote.dart';
import 'package:intl/intl.dart';

import '../modeles/modelNote.dart';

class NoteDetailPage extends StatefulWidget {
  final int noteId;

  const NoteDetailPage({
    Key? key,
    required this.noteId,
}): super(key: key);

  @override
  _NoteDetailPageState createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late Note note;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshNote();
  }
  
  Future refreshNote() async {
    setState(() => isLoading = true);
    
    this.note = await NotesDatabase.instance.readNote(widget.noteId);

    setState(() => isLoading = false);
  }
  @override
  Widget build(BuildContext context) =>  Scaffold(
    appBar: AppBar(
      actions: [
        editButton(), deleteButton()
      ],
    ),
    body: isLoading
    ? Center(child: CircularProgressIndicator())
    :Padding(
        padding: EdgeInsets.all(12),
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        children: [
          Text(
            note.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            DateFormat.yMMMd().format(note.createdTime),
            style: TextStyle(
              color: Colors.white38,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            note.description,
            style: TextStyle(
              color: Colors.white70
            ),
          ),
        ],
      ),
    ),
  );
  
  Widget editButton() => IconButton(
    icon: Icon(Icons.edit_outlined),
    onPressed: () async {
      if (isLoading) return;

      await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AjoutNote(note: note),));
      refreshNote();
    });
  
  Widget deleteButton() => IconButton(
  icon: Icon(Icons.delete_outline),
  onPressed: () async {
    await NotesDatabase.instance.delete(widget.noteId);

    Navigator.of(context).pop;
  },
);
}

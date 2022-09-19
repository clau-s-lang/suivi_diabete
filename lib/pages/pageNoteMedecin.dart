import 'package:flutter/material.dart';
import 'package:gestion_diabete/database/dbNote.dart';
import 'package:gestion_diabete/pages/pageAjoutNote.dart';
import 'package:gestion_diabete/pages/pageMenuMedecin.dart';
import 'package:gestion_diabete/pages/pageNoteDetails.dart';
import '../Reusables/NoteCardWidget.dart';
import '../modeles/modelNote.dart';
import 'package:intl/intl.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NotesMedecin extends StatefulWidget {
  @override
  _NotesMedecinState createState() => _NotesMedecinState();
}

class _NotesMedecinState extends State<NotesMedecin> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();
    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await NotesDatabase.instance.readAllNotes();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: MenuMedecin(),
        appBar: AppBar(
          title: Text('Notes'),
          backgroundColor: Color(0xFF216DAD),
          actions: [
            Icon(Icons.search),
            SizedBox(
              width: 12,
            )
          ],
        ),
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : notes.isEmpty
                  ? Text(
                      'Pas de notes',
                    )
                  : buildNotes(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AjoutNote()));
            refreshNotes();
          },
        ),
      );

  Widget buildNotes() => StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(8),
        itemCount: notes.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (BuildContext context, int index) {
          final note = notes[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => NoteDetailPage(noteId: note.id!)),
              );
              refreshNotes();
            },
            child: NoteCardWidget(note: note, index: index),
           );
        },
      );
}

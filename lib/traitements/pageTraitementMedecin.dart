import 'package:flutter/material.dart';
import '../menus/pageMenuMedecin.dart';

class AfficherTraitement extends StatefulWidget {
  @override
  _AfficherTraitementState createState() => _AfficherTraitementState();
}

class _AfficherTraitementState extends State<AfficherTraitement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuMedecin(),
      appBar: AppBar(
        title: Text('Traitement Médical'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: ListView(

      ),
    );
  }
}

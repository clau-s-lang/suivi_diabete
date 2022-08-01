import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/pages/pageDataPatient.dart';

import '../modeles/Reusables.dart';

class MenuPatient extends StatefulWidget {
  @override
  _MenuPatientState createState() => _MenuPatientState();
}

class _MenuPatientState extends State<MenuPatient> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          MenuHeader(
            ident: 'Diabète de type 2',
            noms: 'Claudette Vanzirwe',
            profil: 'images/clau.jpg',
          ),
          MenuNames(
            designation: 'Ajouter des données',
            icone: Icon(
              Icons.library_add_outlined,
              //color: Color(0xFFA2CCF9),
            ),
            ToPage: DonneesPatient(),
          ),
          MenuNames(
            designation: 'Mon dossier médical',
            icone: Icon(Icons.medical_services_outlined),
            ToPage: DonneesPatient(),
          ),

          MenuNames(
            designation: 'Contacter mon médecin',
            icone: Icon(Icons.call),
            ToPage: DonneesPatient(),
          ),
          MenuNames(
            designation: 'Mon historique',
            icone: Icon(Icons.data_exploration_outlined),
            ToPage: DonneesPatient(),
          ),
          MenuNames(
            designation: 'Infos sur le diabète',
            icone: Icon(Icons.feed_outlined),
            ToPage: DonneesPatient(),
          ),
          MenuNames(
            designation: 'Mon Glucomètre',
            icone: Icon(Icons.bluetooth_audio_outlined),
            ToPage: DonneesPatient(),
          ),
          MenuNames(
            designation: 'Paramètres',
            icone: Icon(Icons.settings_outlined),
            ToPage: DonneesPatient(),
          ),
          MenuNames(
            designation: 'Déconnexion',
            icone: Icon(Icons.exit_to_app),
            ToPage: DonneesPatient(),
          ),
        ],
      ),
    );
  }
}

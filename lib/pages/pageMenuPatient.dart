import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/pages/pageAccueilMonTraitement.dart';
import 'package:gestion_diabete/pages/pageChat.dart';
import 'package:gestion_diabete/pages/pageChatAccueilMedecin.dart';
import 'package:gestion_diabete/pages/pageDataPatient.dart';
import 'package:gestion_diabete/pages/pageHistoriqueMedecin.dart';
import 'package:gestion_diabete/pages/pageMonDossierMedicalMedecin.dart';

import '../Reusables/AppBarDrawer.dart';
import '../Reusables/DenominationMenus.dart';
import '../Reusables/ChampdeRedactionMessage.dart';

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
            ToPage: DossierMedical(),
          ),

          MenuNames(
            designation: 'Contacter mon médecin',
            icone: Icon(Icons.call),
            ToPage: Messagerie(),
          ),
          MenuNames(
            designation: 'Mon historique',
            icone: Icon(Icons.data_exploration_outlined),
            ToPage: HistoriqueChart(),
          ),
          MenuNames(
            designation: 'Mon traitement',
            icone: Icon(Icons.medication_outlined),
            ToPage: AccueilMonTraitement(),
          ),
          MenuNames(
            designation: 'Infos sur le diabète',
            icone: Icon(Icons.feed_outlined),
            ToPage: AccueilChatMedecin(),
          ),
          MenuNames(
            designation: 'Paramètres',
            icone: Icon(Icons.settings_outlined),
            ToPage: DonneesPatient(),
          ),
          MenuNames(
            designation: 'Déconnexion vers Medecin',
            icone: Icon(Icons.exit_to_app),
            ToPage: AccueilChatMedecin(),
          ),
        ],
      ),
    );
  }
}

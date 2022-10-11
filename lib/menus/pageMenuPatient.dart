import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/dashboards/pageDahboqrdOrdonnance.dart';
import 'package:gestion_diabete/dashboards/pageDashbaordDossPat.dart';
import '../ordonnances/pageOrdonnancePatient.dart';
import '../signes_vitaux/pageDataPatient.dart';
import '../traitements/pageAccueilMonTraitement.dart';
import '../chat/pageChat.dart';
//import 'package:gestion_diabete/pages/pageChatAccueilMedecin.dart';
//import 'package:gestion_diabete/pages/pageDataPatient.dart';
import '../historique/pageHistoriqueMedecin.dart';
import '../dossier_med/pageMonDossierMedicalMedecin.dart';

import '../Reusables/AppBarDrawer.dart';
import '../Reusables/DenominationMenus.dart';
import '../Reusables/ChampdeRedactionMessage.dart';
import '../chat/pageChatAccueilMedecin.dart';
import '../traitements/pageTraitementPatient.dart';

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
            designation: 'Mes ordonnances',
            icone: Icon(Icons.medical_services_outlined),
            ToPage: DashOrdonnance(),
          ),

          MenuNames(
            designation: 'Mon dossier médical',
            icone: Icon(Icons.medical_services_outlined),
            ToPage: DashDossPat(),
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
            ToPage: TraitementPatient(),
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

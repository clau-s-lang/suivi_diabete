import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../chat/pageChat.dart';
//import 'package:gestion_diabete/pages/pageChatAccueilMedecin.dart';
//import 'package:gestion_diabete/pages/pageDataPatient.dart';
import '../historique/pageHistoriqueMedecin.dart';
import '../dossier_med/pageMonDossierMedicalMedecin.dart';
import '../notes/pageNoteMedecin.dart';
import '../chat/pageChatAccueilMedecin.dart';
import '../ordonnances/pageOrdonanceMedecin.dart';
import '../signes_vitaux/pageDataPatient.dart';
import '../traitements/pageTraitementMedecin.dart';

import '../Reusables/AppBarDrawer.dart';
import '../Reusables/DenominationMenus.dart';
import '../Reusables/ChampdeRedactionMessage.dart';

class MenuMedecin extends StatefulWidget {
  @override
  _MenuMedecinState createState() => _MenuMedecinState();
}

class _MenuMedecinState extends State<MenuMedecin> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          MenuHeader(
            ident: 'Néphrologue',
            noms: 'Queen Mughole',
            profil: 'images/clau.jpg',
          ),
          MenuNames(
            designation: 'Données chargéés',
            icone: Icon(
              Icons.library_add_outlined,
              //color: Color(0xFFA2CCF9),
            ),
            ToPage: DonneesPatient(),
          ),
          MenuNames(
            designation: 'Traitement en cours',
            icone: Icon(Icons.medication_outlined),
            ToPage: AfficherTraitement(),
          ),
          MenuNames(
            designation: 'Ordonnances',
            icone: Icon(Icons.feed_outlined),
            ToPage: PrescriptionMed(),
          ),
          MenuNames(
            designation: 'Contacter ce patient',
            icone: Icon(Icons.call),
            ToPage: AccueilChatMedecin(),
          ),
          MenuNames(
            designation: 'Dossier médical',
            icone: Icon(Icons.medical_services_outlined),
            ToPage: DossierMedical(),
          ),
          MenuNames(
            designation: 'Historique des données',
            icone: Icon(Icons.data_exploration_outlined),
            ToPage: HistoriqueChart(),
          ),
          MenuNames(
            designation: 'Notes',
            icone: Icon(Icons.feed_outlined),
            ToPage: NotesMedecin(),
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

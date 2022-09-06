import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/pages/pageChat.dart';
import 'package:gestion_diabete/pages/pageChatAccueilMedecin.dart';
import 'package:gestion_diabete/pages/pageDataPatient.dart';
import 'package:gestion_diabete/pages/pageMonDossierMedicalMedecin.dart';
import 'package:gestion_diabete/pages/pageOrdonanceMedecin.dart';

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
            designation: 'Contacter mes patients',
            icone: Icon(Icons.call),
            ToPage: AccueilChatMedecin(),
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
            designation: 'Mon traitement',
            icone: Icon(Icons.medication_outlined),
            ToPage: DonneesPatient(),
          ),
          MenuNames(
            designation: 'Ordonnances',
            icone: Icon(Icons.feed_outlined),
            ToPage: PrescriptionMed(),
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

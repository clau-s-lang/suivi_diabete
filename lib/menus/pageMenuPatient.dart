import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/chat/pageChatBon.dart';
import 'package:gestion_diabete/dashboards/pageDahboqrdOrdonnance.dart';
import 'package:gestion_diabete/dashboards/pageDashbaordDossPat.dart';
import 'package:image_picker/image_picker.dart';
import '../profil/profil_patient.dart';
import '../signes_vitaux/pageDataPatient.dart';
import '../chat/pageChat.dart';
import '../historique/pageHistoriqueMedecin.dart';
import '../Reusables/AppBarDrawer.dart';
import '../Reusables/DenominationMenus.dart';
import '../chat/pageChatAccueilMedecin.dart';
import '../traitements/pageTraitementPatient.dart';

class MenuPatient extends StatefulWidget {
  @override
  _MenuPatientState createState() => _MenuPatientState();
}

class _MenuPatientState extends State<MenuPatient> {
  bool isLoaded = false;
  File? _image;
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Patient')
              .doc(user!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return Material(
                  child: Center(
                      child: Text('Veuillez vous connecter à internet')));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Material(
                  child: Center(child: CircularProgressIndicator()));
            }

            print(user!.uid);
            if (!snapshot.hasData) {
              return Material(
                child: Center(
                  child: Text('Pas de données'),
                ),
              );
            }
            DocumentSnapshot doc = snapshot.data!;

            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                /*MenuHeader(
            ident: 'Diabète de type 2',
            noms: 'Claudette Vanzirwe',
            profil: 'images/clau.jpg',
          ),*/
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFF216DAD),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'E-Diab Care',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          GestureDetector(
                              onTap: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => EditProfilPat())),
                            child: Text(
                              'Editer le profil',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage:NetworkImage(doc['imgProfil']),
                            backgroundColor: Colors.grey,
                            radius: 35,
                            child: Icon(
                              Icons.account_circle_outlined,
                              color: Colors.white70,
                              size: 60,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            children: [
                              Text(
                                doc['fname'] + ' ' + doc['sname'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                doc['typeDediabte'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
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
                  ToPage: MessagesBon(patientId: user!.uid,),
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
            );
          }),
    );
  }
}

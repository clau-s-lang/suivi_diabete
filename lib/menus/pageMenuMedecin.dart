import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/api/apiProvider.dart';
import 'package:gestion_diabete/profil/profil_medecin.dart';
import 'package:provider/provider.dart';
import '../notes/pageNoteMedecin.dart';
import '../Reusables/AppBarDrawer.dart';
import '../Reusables/DenominationMenus.dart';

class MenuMedecin extends StatefulWidget {

  @override
  _MenuMedecinState createState() => _MenuMedecinState();
}

class _MenuMedecinState extends State<MenuMedecin> {
  bool isLoaded = false;
  File? _image;
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: StreamBuilder<DocumentSnapshot>(
        stream:  FirebaseFirestore.instance
            .collection('Medecin')
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
                              MaterialPageRoute(builder: (context) => EditProfilMed())),
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
                              doc['specialisation'],
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
                designation: 'Notes',
                icone: Icon(Icons.feed_outlined),
                ToPage: NotesMedecin(),
              ),
              MenuNames(
                designation: 'Paramètres',
                icone: Icon(Icons.settings_outlined),
                ToPage: NotesMedecin(),
              ),
              ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Déconnexion', style: TextStyle(fontSize: 15),),
                  onTap: () {
                    final provider =
                        Provider.of<ProviderApi>(context, listen: false);
                    provider.logOut();
                  }),
            ],
          );
        }
      ),
    );
  }
}

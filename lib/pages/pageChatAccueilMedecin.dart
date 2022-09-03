import 'package:flutter/material.dart';
import 'package:gestion_diabete/pages/pageMenuMedecin.dart';

import '../Constants/CarteMessagerieMedecin.dart';

class AccueilChatMedecin extends StatefulWidget {
  @override
  _AccueilChatMedecinState createState() => _AccueilChatMedecinState();
}

class _AccueilChatMedecinState extends State<AccueilChatMedecin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuMedecin(),
      appBar: AppBar(
        title: Text('Messagerie'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            child: Card(
              color: Colors.white,
              // margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Column(
                children: [
                  CardDeChat(
                    profil: 'images/clau.jpg',
                    Nom: 'Claudette Vanzirwe',
                    message: 'Bonjour Dr. J\'ai des preoccupations à propos de ma sante',
                    heure: '10h37',
                    nombreMessage: '2',
                  ),
                  SizedBox(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  CardDeChat(
                    profil: 'images/clau.jpg',
                    Nom: 'Nick Azaria',
                    message: 'Bonjour Dr. Ma sante evolue tres bien',
                    heure: '10h37',
                    nombreMessage: '2',
                  ),
                  SizedBox(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  CardDeChat(
                    profil: 'images/clau.jpg',
                    Nom: 'Claudette Vanzirwe',
                    message: 'Bonjour Dr. J\'ai des preoccupations à propos de ma sante',
                    heure: '10h37',
                    nombreMessage: '2',
                  ),
                  SizedBox(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  CardDeChat(
                    profil: 'images/clau.jpg',
                    Nom: 'Claudette Vanzirwe',
                    message: 'Bonjour Dr. J\'ai des preoccupations à propos de ma sante',
                    heure: '10h37',
                    nombreMessage: '2',
                  ),
                  SizedBox(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  CardDeChat(
                    profil: 'images/clau.jpg',
                    Nom: 'Claudette Vanzirwe',
                    message: 'Bonjour Dr. J\'ai des preoccupations à propos de ma sante',
                    heure: '10h37',
                    nombreMessage: '2',
                  ),
                  SizedBox(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  CardDeChat(
                    profil: 'images/clau.jpg',
                    Nom: 'Claudette Vanzirwe',
                    message: 'Bonjour Dr. J\'ai des preoccupations à propos de ma sante',
                    heure: '10h37',
                    nombreMessage: '2',
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}


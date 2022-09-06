import 'package:flutter/material.dart';
import 'package:gestion_diabete/pages/pageDataPatient.dart';
import 'package:gestion_diabete/pages/pageMenuPatient.dart';

import '../Reusables/BoutonDeConfimation.dart';
import '../Reusables/ChampsIdentifiants.dart';
import '../Reusables/Icone de retour.dart';
import '../Reusables/ChampdeRedactionMessage.dart';
import '../Reusables/TitreSansAppBar.dart';

class Connexion extends StatefulWidget {
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final email = TextEditingController();
  final Mdp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ReusableRetour(),
          ReusableMenuName(
            'Connexion',
          ),
          SizedBox(
            height: 80,
          ),
          Column(
            children: [
              ReusableTextFormField(
                name: email,
                message: 'Ce champ est obligatoire',
                label: 'Email',
                hint: 'Exemple@gmail.com',
                icone: (Icons.mail_outlined),
              ),
              SizedBox(
                height: 10,
              ),
              ReusableTextFormField(
                name: Mdp,
                message: 'Ce champ est obligatoire',
                label: 'Mot de passe',
                hint: 'Completer votre mot de passe',
                icone: (Icons.password_outlined),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text(
                    'Mot de passe oublié?',
                    style: TextStyle(
                      color: Color(0xFFA2CCF9),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ReusableButton(
                text: 'Se Connecter',
                ToPage: DonneesPatient(),
                dim: 300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

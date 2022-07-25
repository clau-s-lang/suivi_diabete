import 'package:flutter/material.dart';

import '../modeles/Reusables.dart';

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
            height: 100,
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
            ],
          ),
        ],
      ),
    );
  }
}

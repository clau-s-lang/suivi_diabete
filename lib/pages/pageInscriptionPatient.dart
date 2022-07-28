//import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/pages/pageInscriptionMedecin.dart';

import '../modeles/Reusables.dart';

class InscriptionPatient extends StatefulWidget {
  @override
  _InscriptionPatientState createState() => _InscriptionPatientState();
}

class _InscriptionPatientState extends State<InscriptionPatient> {
  final name = TextEditingController();
  final prenom = TextEditingController();
  final genre = TextEditingController();
  final adresse = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final code = TextEditingController();
  final MdP = TextEditingController();
  final confimMdP = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ReusableRetour(),
          ReusableMenuName('Inscription du patient'),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              ReusableTextFormField(
                name: name,
                message: 'Ce champ est obligatoire',
                label: 'Nom',
                hint: 'Completer votre nom',
                icone: (Icons.account_circle_outlined),
              ),
              SizedBox(
                height: 10,
              ),
              ReusableTextFormField(
                name: prenom,
                message: 'Ce champ est obligatoire',
                label: 'Prenom',
                hint: 'Completer votre prenom',
                icone: (Icons.account_circle_outlined),
              ),
              SizedBox(
                height: 10,
              ),
              ReusableTextFormField(
                name: genre,
                message: 'Ce champ est obligatoire',
                label: 'Genre',
                hint: 'Completer votre prenom',
                icone: (Icons.account_circle_outlined),
              ),
              SizedBox(
                height: 10,
              ),
              ReusableTextFormField(
                name: adresse,
                message: 'Ce champ est obligatoire',
                label: 'Adresse',
                hint: 'Q.Keshero, Av.Ngobobo, Com. Goma',
                icone: (Icons.location_on_outlined),
              ),
              SizedBox(
                height: 10,
              ),
              ReusableTextFormField(
                name: phone,
                message: 'Ce champ est obligatoire',
                label: 'Téléphone',
                hint: '09707129016',
                icone: (Icons.phone_outlined),
              ),
              SizedBox(
                height: 10,
              ),
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
                name: code,
                message: 'Ce champ est obligatoire',
                label: 'Code du medecin',
                hint: 'Completer le code votre medecin',
                icone: (Icons.lock_outline),
              ),
              SizedBox(
                height: 10,
              ),
              ReusableTextFormField(
                name: MdP,
                message: 'Ce champ est obligatoire',
                label: 'Mot de passe',
                hint: 'Completer votre mot de passe',
                icone: (Icons.password_outlined),
              ),
              SizedBox(
                height: 10,
              ),
              ReusableTextFormField(
                name: confimMdP,
                message: 'Les mots de passe correspondent pas',
                label: 'Confirmer mot de passe',
                hint: 'Completer le meme mot de passe',
                icone: (Icons.password_outlined),
              ),
              SizedBox(
                height: 10,
              ),
              ReusableButton(
                text: 'S\'inscrire',
                ToPage: InscriptionMedecin(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

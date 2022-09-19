//import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/pages/pageInscriptionMedecin.dart';

import '../Reusables/BoutonDeConfimation.dart';
import '../Reusables/ChampsIdentifiants.dart';
import '../Reusables/Icone de retour.dart';
import '../Reusables/ChampdeRedactionMessage.dart';
import '../Reusables/TitreSansAppBar.dart';

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

  final items = ['Masculin', 'Feminin', 'Genre'];
  String? value = 'Genre';

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
      );
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
                type: TextInputType.name,
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
                type: TextInputType.name,
                message: 'Ce champ est obligatoire',
                label: 'Prenom',
                hint: 'Completer votre prenom',
                icone: (Icons.account_circle_outlined),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: value,
                    isExpanded: true,
                    iconSize: 36,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    ),
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(() {
                      this.value = value;
                    }),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ReusableTextFormField(
                name: genre,
                type: TextInputType.text,
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
                type: TextInputType.text,
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
                type: TextInputType.phone,
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
                type: TextInputType.emailAddress,
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
                type: TextInputType.text,
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
                type: TextInputType.visiblePassword,
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
                type: TextInputType.visiblePassword,
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
                dim: 300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

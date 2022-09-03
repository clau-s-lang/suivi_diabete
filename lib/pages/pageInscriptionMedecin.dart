import 'package:flutter/material.dart';
import 'package:gestion_diabete/pages/pageLogin.dart';

import '../Constants/Reusables.dart';

class InscriptionMedecin extends StatefulWidget {
  @override
  _InscriptionMedecinState createState() => _InscriptionMedecinState();
}

class _InscriptionMedecinState extends State<InscriptionMedecin> {

  final name = TextEditingController();
  final postnom = TextEditingController();
  final genre = TextEditingController();
  final specialite = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final clinique = TextEditingController();
  final MdP = TextEditingController();
  final confirmMdP = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ReusableRetour(),
          ReusableMenuName(
              'Inscription du medecin',
          ),
          SizedBox(height: 20,),
          Column(
            children: [
              ReusableTextFormField(
                name: name,
                message: 'Ce champ est obligatoire',
                label: 'Nom',
                hint: 'Completer votre nom',
                icone: (Icons.account_circle_outlined),
              ),
              SizedBox(height: 10,),
              ReusableTextFormField(
                name: postnom,
                message: 'Ce champ est obligatoire',
                label: 'Prenom',
                hint: 'Completer votre postnom',
                icone: (Icons.account_circle_outlined),
              ),
              SizedBox(height: 10,),
              ReusableTextFormField(
                name: genre,
                message: 'Ce champ est obligatoire',
                label: 'Genre',
                hint: 'Choisissez votre genre',
                icone: (Icons.account_circle_outlined),
              ),
              SizedBox(height: 10,),
              ReusableTextFormField(
                name: specialite,
                message: 'Ce champ est obligatoire',
                label: 'Specialisation',
                hint: 'Completer votre specialisation',
                icone: (Icons.medical_services_outlined),
              ),
              SizedBox(height: 10,),
              ReusableTextFormField(
                name: clinique,
                message: 'Ce champ est obligatoire',
                label: 'Clinique',
                hint: 'Completer votre clinique',
                icone: (Icons.local_hospital_outlined),
              ),
              SizedBox(height: 10,),
              ReusableTextFormField(
                name: phone,
                message: 'Ce champ est obligatoire',
                label: 'Téléphone',
                hint: '09707129016',
                icone: (Icons.phone_outlined),
              ),
              SizedBox(height: 10,),
              ReusableTextFormField(
                name: email,
                message: 'Ce champ est obligatoire',
                label: 'Email',
                hint: 'Exemple@gmail.com',
                icone: (Icons.mail_outlined),
              ),
              SizedBox(height: 10,),
              ReusableTextFormField(
                name: MdP,
                message: 'Ce champ est obligatoire',
                label: 'Mot de passe',
                hint: 'Completer votre mot de passe',
                icone: (Icons.password_outlined),
              ),
              SizedBox(height: 10,),
              ReusableTextFormField(
                name: confirmMdP,
                message: 'Ce champ est obligatoire',
                label: 'Confirmer mot de passe',
                hint: 'Completer le meme mot de passe',
                icone: (Icons.password_outlined),
              ),
              SizedBox(height: 10,),
              ReusableButton(
                text: 'S\'inscrire' ,
                  ToPage:  Connexion(),
                dim: 300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gestion_diabete/modeles/modelSigneVitaux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../api/apiProvider.dart';
import '../menus/pageMenuPatient.dart';
import '../users/pageLogin.dart';
import '../Reusables/BoutonDeConfimation.dart';
import '../Reusables/ChampData.dart';
import '../Reusables/ChampDossierMed.dart';
import '../Reusables/IconeDemostrative.dart';
import '../Reusables/PlageIdentifiantData.dart';
import '../Reusables/PlageSansIcone.dart';

class DonneesPatient extends StatefulWidget {
  @override
  _DonneesPatientState createState() => _DonneesPatientState();
}

class _DonneesPatientState extends State<DonneesPatient> {
  bool isLoaded = false;
  File? _image;
  final _formKey = GlobalKey<FormState>();
  final glycemie = TextEditingController();
  final insulineBasale = TextEditingController();
  final insulineBolus = TextEditingController();
  final insulineCorr = TextEditingController();
  final duree = TextEditingController();
  final nbrePas = TextEditingController();
  final poids = TextEditingController();
  final hba1c = TextEditingController();
  final PAsyst = TextEditingController();
  final PAdiast = TextEditingController();
  final remarque = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;
  String activitePhysique = 'Musculation';
  String contexte = 'Stress';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuPatient(),
      appBar: AppBar(
        title: Text('Ajouter des données'),
        backgroundColor: Color(0xFF216DAD),
        actions: [
          TextButton.icon(
              icon: Icon(Icons.logout, color: Colors.white,),
              onPressed: (){
                final provider = Provider.of<ProviderApi>(context, listen: false);
                provider.logOut();
                // Center(child: CircularProgressIndicator(),);
              },
              label: Text('Deconnexion', style:TextStyle(color: Colors.white),)),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            PlageDeDonnees(
              designation: 'GLYCEMIE',
              icone: Icon(
                Icons.bloodtype_outlined,
                color: Color(0xFF216DAD),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ReusableTextFormFieldData(
              name: glycemie,
              message: 'Ce champ est obligatoire',
              label: 'Glycemie',
              hint: 'Exemple : 2.5 g/l',
            ),
            SizedBox(
              height: 10,
            ),
            PlageDeDonnees(
              icone: Icon(Icons.star, color: Color(0xFF216DAD)),
              designation: 'INSULINE',
            ),
            SizedBox(
              height: 10,
            ),
            ReusableTextFormFieldData(
              name: insulineBasale,
              message: 'Ce champ est obligatoire',
              label: 'Insuline basale',
              hint: 'Exemple : 2.5 U',
            ),
            SizedBox(
              height: 10,
            ),
            ReusableTextFormFieldData(
              name: insulineBolus,
              message: 'Ce champ est obligatoire',
              label: 'Insuline bolus',
              hint: 'Exemple : 2.5 U',
            ),
            SizedBox(
              height: 10,
            ),
            ReusableTextFormFieldData(
              name: insulineCorr,
              message: 'Ce champ est obligatoire',
              label: 'Insuline de correction',
              hint: 'Exemple : 2.5 U',
            ),
            SizedBox(
              height: 10,
            ),
            PlageDeDonnees(
              icone: Icon(Icons.snowshoeing_outlined, color: Color(0xFF216DAD)),
              designation: 'NOURRITURE PRISE',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: isLoaded
                      ? Column(
                          children: [
                            Image.file(
                              _image!,
                              height: 50,
                            ),
                            /* Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton.icon(
                                  onPressed: () async {
                                    await _image!.delete();
                                    setState(() {
                                      isLoaded = false;
                                    });
                                  },
                                  icon: Icon(Icons.delete_outline),
                                  label: Text(''),
                                ),
                                OutlinedButton.icon(
                                  onPressed: () async {
                                    final pickedFile = await ImagePicker().getImage(
                                      source: ImageSource.gallery,
                                      maxHeight: 150,
                                      maxWidth: 150,
                                      imageQuality: 100,
                                    );
                                    if (pickedFile != null) {
                                      setState(() {
                                        _image = File(pickedFile.path);
                                        isLoaded = true;
                                      });
                                    }
                                  },
                                  icon: Icon(Icons.camera_alt_outlined),
                                  label: Text(''),
                                ),
                              ],
                            ),*/
                          ],
                        )
                      : InkWell(
                          child: Placeholder(
                            color: Colors.transparent,
                            child: CircleAvatar(
                              child: Icon(
                                Icons.account_circle_outlined,
                                color: Colors.white70,
                                size: 30,
                              ),
                              backgroundColor: Colors.grey,
                              maxRadius: 10,
                            ),
                            fallbackHeight: 50,
                            fallbackWidth: 50,
                          ),
                          onTap: () async {
                            final pickedFile = await ImagePicker().getImage(
                              source: ImageSource.camera,
                              maxHeight: 50,
                              maxWidth: 50,
                              imageQuality: 100,
                            );
                            if (pickedFile != null) {
                              setState(() {
                                _image = File(pickedFile.path);
                                isLoaded = true;
                              });
                            }
                          },
                        ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            PlageDeDonnees(
              icone: Icon(Icons.snowshoeing_outlined, color: Color(0xFF216DAD)),
              designation: 'ACTIVITE PHYSIQUE',
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconDemo(
                  image: 'images/muscu.PNG',
                  designation: 'Muscu',
                ),
                SizedBox(
                  width: 10,
                ),
                IconDemo(
                  image: 'images/sportCo.PNG',
                  designation: 'Sport collectif',
                ),
                SizedBox(
                  width: 10,
                ),
                IconDemo(
                  image: 'images/cardio.PNG',
                  designation: 'Cardio',
                ),
                SizedBox(
                  width: 10,
                ),
                IconDemo(
                  image: 'images/sportMarche.PNG',
                  designation: 'Marche',
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: Text(
                      'Musculation',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Radio<String>(
                      value: 'Musculation',
                      groupValue: activitePhysique,
                      onChanged: (value) {
                        setState(() {
                          activitePhysique = value!;
                        });
                      },
                      activeColor: Color(0xFF216DAD),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: Text(
                      'Sport Collectif',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Radio<String>(
                      value: 'Sport Collectif',
                      groupValue: activitePhysique,
                      onChanged: (value) {
                        setState(() {
                          activitePhysique = value!;
                        });
                      },
                      activeColor: Color(0xFF216DAD),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: Text(
                      'Cardio Training',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Radio<String>(
                      value: 'Cardio Training',
                      groupValue: activitePhysique,
                      onChanged: (value) {
                        setState(() {
                          activitePhysique = value!;
                        });
                      },
                      activeColor: Color(0xFF216DAD),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: Text(
                      'Marche',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Radio<String>(
                      value: 'Marche',
                      groupValue: activitePhysique,
                      onChanged: (value) {
                        setState(() {
                          activitePhysique = value!;
                        });
                      },
                      activeColor: Color(0xFF216DAD),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            PlageDeDescription(
              designation: 'Description',
            ),
            SizedBox(
              height: 10,
            ),
            ReusableTextFormFieldDossierOccaz(
              name: duree,
              label: 'Durée',
              hint: 'Exemple : 2:30 hh:mm',
            ),
            SizedBox(
              height: 10,
            ),
            ReusableTextFormFieldDossierOccaz(
              name: nbrePas,
              label: 'Nombre de pas',
              hint: 'Exemple :  100 pas',
            ),
            SizedBox(
              height: 10,
            ),
            PlageDeDonnees(
              icone: Icon(Icons.edit_note_outlined, color: Color(0xFF216DAD)),
              designation: 'CONTEXTE',
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconDemo(
                  image: 'images/stress.PNG',
                  designation: 'Stress',
                ),
                SizedBox(
                  width: 5,
                ),
                IconDemo(
                  image: 'images/maladie.PNG',
                  designation: 'Maladie',
                ),
                SizedBox(
                  width: 5,
                ),
                IconDemo(
                  image: 'images/allergie.PNG',
                  designation: 'Allérgie',
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: Text(
                      'Stress',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Radio<String>(
                      value: 'Stress',
                      groupValue: contexte,
                      onChanged: (value) {
                        setState(() {
                          contexte = value!;
                        });
                      },
                      activeColor: Color(0xFF216DAD),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: Text(
                      'Maladie',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Radio<String>(
                      value: 'Maladie',
                      groupValue: contexte,
                      onChanged: (value) {
                        setState(() {
                          contexte = value!;
                        });
                      },
                      activeColor: Color(0xFF216DAD),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: Text(
                      'Allérgie',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Radio<String>(
                      value: 'Allérgie',
                      groupValue: contexte,
                      onChanged: (value) {
                        setState(() {
                          contexte = value!;
                        });
                      },
                      activeColor: Color(0xFF216DAD),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            PlageDeDonnees(
              icone: Icon(Icons.edit_note_outlined, color: Color(0xFF216DAD)),
              designation: 'OCCASIONNEL',
            ),
            SizedBox(
              height: 10,
            ),
            ReusableTextFormFieldDossierOccaz(
              name: poids,
              label: 'Poids',
              hint: 'Exemple : 65.5 Kg',
            ),
            SizedBox(
              height: 10,
            ),
            ReusableTextFormFieldDossierOccaz(
              name: hba1c,
              label: 'HbA1c',
              hint: 'Exemple : 7.0 ',
            ),
            SizedBox(
              height: 10,
            ),
            ReusableTextFormFieldDossierOccaz(
              name: PAsyst,
              label: 'Pression Arterielle syst.',
              hint: 'Exemple : 2.5 U',
            ),
            SizedBox(
              height: 10,
            ),
            ReusableTextFormFieldDossierOccaz(
              name: PAdiast,
              label: 'Pression Arterielle diast',
              hint: 'Exemple : 2.5 U',
            ),
            SizedBox(
              height: 10,
            ),
            PlageDeDonnees(
              icone: Icon(Icons.edit_note_outlined, color: Color(0xFF216DAD)),
              designation: 'REMARQUES',
            ),
            SizedBox(
              height: 10,
            ),
            ReusableTextFormFieldDossierOccaz(
              name: remarque,
              label: 'Remarques',
              hint: 'Exemple: J\'ai constaté que ...',
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableButton(
                  text: 'Annuler',
                  ToPage: Connexion(),
                  dim: 150,
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      try {
                        setState(() {
                          loading = true;
                        });
                        final signe = SigneVitaux(

                         /* idMedecin: auth.currentUser!.uid,*/

                          patientId: auth.currentUser!.uid,
                          glycemie: glycemie.text,
                          insulinebasale: insulineBasale.text,
                          insulineBolus: insulineBolus.text,
                          insulineDeCorrection: insulineCorr.text,
                          activitePhysique: activitePhysique,
                          duree: duree.text,
                          nbreDePas: nbrePas.text,
                          contexte: contexte,
                          poids: poids.text,
                          hbA1c: hba1c.text,
                          pressionArterielleSyst: PAsyst.text,
                          pressionArterielleDiast: PAdiast.text,
                          remarque: remarque.text,
                          time: Timestamp.now().toString(),
                        );
                        final provider =
                            Provider.of<ProviderApi>(context, listen: false);
                        provider.addSigne(signe: signe);
                      } catch (e) {
                        Fluttertoast.showToast(msg: e.toString());
                        setState(() {
                          loading = false;
                        });
                      }
                      clearFields();
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Color(0xFFA2CCF9),
                    ),
                    child: Center(
                      child: Text(
                        'Envoyer',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  void clearFields() {
    glycemie.clear();
    insulineBasale.clear();
    insulineBolus.clear();
    insulineCorr.clear();
    duree.clear();
    nbrePas.clear();
    poids.clear();
    hba1c.clear();
    PAsyst.clear();
    PAdiast.clear();
    remarque.clear();
  }
}

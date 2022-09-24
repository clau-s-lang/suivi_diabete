import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/modeles/modelSigneVitaux.dart';
import '../menus/pageMenuPatient.dart';
import '../users/pageLogin.dart';
//import 'package:gestion_diabete/pages/pageMenuPatient.dart';

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

enum contextValues  {Musculation, SportCollectif, Cardio_training, Marche}

class _DonneesPatientState extends State<DonneesPatient> {
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

  String activitePhysique = 'Musculation';
  String  contexte = 'Stress';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuPatient(),
      appBar: AppBar(
        title: Text('Ajouter des données'),
        backgroundColor: Color(0xFF216DAD),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 4,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: Text('Musculation'),
                    leading: Radio<String>(
                      value:'Musculation' ,
                      groupValue: activitePhysique,
                      onChanged: (value){
                        setState(() {
                          activitePhysique = value!;
                        });
                      },
                      activeColor: Color(0xFF216DAD),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: Text('Sport Collectif'),
                    leading: Radio<String>(
                      value:'Sport Collectif',
                      groupValue: activitePhysique,
                      onChanged: (value){
                        setState(() {
                          activitePhysique = value!;
                        });
                      },
                      activeColor: Color(0xFF216DAD),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: Text('Cardio Training'),
                    leading: Radio<String>(
                      value:'Cardio Training' ,
                      groupValue: activitePhysique,
                      onChanged: (value){
                        setState(() {
                          activitePhysique = value!;
                        });
                      },
                      activeColor: Color(0xFF216DAD),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: Text('Marche'),
                    leading: Radio<String>(
                      value:'Marche' ,
                      groupValue: activitePhysique,
                      onChanged: (value){
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
                  width: 10,
                ),
                IconDemo(
                  image: 'images/maladie.PNG',
                  designation: 'Maladie',
                ),
                SizedBox(
                  width: 10,
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
                  onTap: () async{
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState!.save();
                      try{
                        final docIdS = FirebaseFirestore.instance.collection('SigneVitaux').doc();
                        String docId = docIdS.id;
                        await FirebaseFirestore.instance.collection('SigneVitaux').doc(docId).set({
                          'idSigne': docId,
                          'glycemie': glycemie.text,
                          'insulinebasale':insulineBasale.text,
                          'insulineBolus': insulineBolus.text,
                          'insulineDeCorrection':insulineCorr.text,
                          'activitePhysique': activitePhysique,
                          'duree' : duree.text,
                          'nbreDePas' : nbrePas as String,
                          'contexte':contexte,
                          'poids': poids.text,
                          'hbA1c' : hba1c.text,
                          'pressionArterielleSyst':PAsyst.text,
                          'pressionArterielleDiast':PAdiast.text,
                          'remarque':remarque.text,
                          'time': Timestamp.now().toString(),
                        }).whenComplete(() => clearFiels());
                      }catch(e){}
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

  void clearFiels(){
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

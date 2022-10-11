import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/chat/pageChat.dart';
import 'package:gestion_diabete/menus/pageMenuMedecin.dart';
import 'package:gestion_diabete/ordonnances/pageOrdonanceMedecin.dart';
import 'package:gestion_diabete/signes_vitaux/pageDataMedecin.dart';
import 'package:gestion_diabete/traitements/pageTraitementMedecin.dart';
import 'package:image_picker/image_picker.dart';
import '../dossier_med/pageMonDossierMedicalMedecin.dart';
import '../historique/pageHistoriqueMedecin.dart';
import '../signes_vitaux/pageDataPatient.dart';
import '../widget/buttonWidget.dart';

class PatientDescription extends StatefulWidget {
  final String patientId;

  const PatientDescription({Key? key, required this.patientId})
      : super(key: key);

  @override
  State<PatientDescription> createState() => _PatientDescriptionState();
}

class _PatientDescriptionState extends State<PatientDescription> {
  bool isLoaded = false;
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuMedecin(),
      appBar: AppBar(
        title: Text('Suivi personnel'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Patient')
            .doc(widget.patientId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return Material(
                child:
                    Center(child: Text('Veuillez vous connecter à internet')));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Material(child: Center(child: CircularProgressIndicator()));
          }

          print(widget.patientId);
          if (!snapshot.hasData) {
            return Material(
              child: Center(
                child: Text('Pas de données'),
              ),
            );
          }
          DocumentSnapshot doc = snapshot.data!;

          return ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: isLoaded
                        ? Column(
                            children: [
                              Image.file(
                                _image!,
                                height: 150,
                              ),
                            ],
                          )
                        : InkWell(
                            child: Placeholder(
                              color: Colors.transparent,
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.account_circle_outlined,
                                  color: Colors.white70,
                                  size: 80,
                                ),
                                backgroundColor: Colors.grey,
                                maxRadius: 50,
                              ),
                              fallbackHeight: 150,
                              fallbackWidth: 150,
                            ),
                            onTap: () async {
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
                          ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        child: Text(
                          'Ange',
                         // doc['sname'],
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        child: Text('Amina',
                          //doc['fname'],
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        child: Text(
                          'amina@gmail.com',
                         // doc['email'],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  buttonWidget(
                      label: 'Données chargées',
                      iconData: Icons.medical_services_outlined,
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DonneesDuPatient(idPatient:widget.patientId ,)))),
                  buttonWidget(
                      label: 'Prescrire une ordonnance',
                      iconData: Icons.feed_outlined,
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PrescriptionMed(patientId:widget.patientId)))),
                  buttonWidget(
                      label: 'Contacter ce patient',
                      iconData: Icons.message_outlined,
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Messagerie()))),
                  buttonWidget(
                      label: 'Traitements en cours',
                      iconData: Icons.medication_outlined,
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AfficherTraitement()))),
                  buttonWidget(
                      label: 'Dossier médical',
                      iconData: Icons.medication_outlined,
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DossierMedicalPat(patientId:widget.patientId)))),
                  buttonWidget(
                      label: 'Historique glycémique',
                      iconData: Icons.data_exploration_outlined,
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HistoriqueChart()))),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

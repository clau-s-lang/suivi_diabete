import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gestion_diabete/Reusables/EspaceVerticale.dart';
import 'package:gestion_diabete/api/apiProvider.dart';
import 'package:gestion_diabete/modeles/modelOrdonnance.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../menus/pageMenuMedecin.dart';
import '../Reusables/AjoutSuppression.dart';
import '../Reusables/ChampOrdonnance.dart';
import '../Reusables/IdentifiantOrdonance.dart';
import '../widget/pageloading.dart';

class PrescriptionMed extends StatefulWidget {
  final String patientId;

  const PrescriptionMed({Key? key, required this.patientId}) : super(key: key);

  @override
  _PrescriptionMedState createState() => _PrescriptionMedState();
}

class _PrescriptionMedState extends State<PrescriptionMed> {
  final ordonance = TextEditingController();
  final posologie = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            drawer: MenuMedecin(),
            appBar: AppBar(
              title: Text('Prescription Médicale'),
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
                      child: Center(
                          child: Text('Veuillez vous connecter à internet')));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Material(
                      child: Center(child: CircularProgressIndicator()));
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
                return Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Column(
//crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                'E-Diab Health Care Service',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          IdOrdonnance(
                            variable: 'Patient : ',
                            valeur: 'Claudette Vanzirwe',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          IdOrdonnance(
                            variable: 'Age : ',
                            valeur: '24' + 'ans',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          IdOrdonnance(
                              variable: 'Date : ', valeur: '24/08/2022'),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                                '------------------------------------------------------------------------------------'),
                          ),
                        ],
                      ),
                      EspaceVerticale(),
                      ChampOrdannance(
                        ordonance: ordonance,
                        posologie: posologie,
                        label: 'Designation',
                        hint: 'Exemple : Paracétamol',
                        message:
                            'Vous ne pouvez pas envoyer un formulaire vide',
                      ),
                      EspaceVerticale(),
                      AjoutSuppression(
                        icone: Icon(
                          Icons.add_circle_outline_outlined,
                          color: Color(0xFFA2CCF9),
                          size: 15,
                        ),
                        designation: 'Ajouter',
                        couleur: Color(0xFFA2CCF9),
                      ),
                      EspaceVerticale(),
                      Column(
                        children: [
                          IdOrdonnance(
                              variable: 'Médecin : ', valeur: 'Queen Mughole'),
                          SizedBox(
                            height: 10,
                          ),
                          IdOrdonnance(
                              variable: 'Signature : ', valeur: 'signature')
                        ],
                      ),
                      EspaceVerticale(),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            try {
                              setState(() {
                                loading = true;
                              });
                              final ord = Ordonnance(
                                idPatient: doc['idPatient'],
                                idMedecin: auth.currentUser!.uid,
                                designation: ordonance.text,
                                posologie: posologie.text,
                                datedeCreation: DateFormat('yyyy-MM-dd')
                                    .format(DateTime.now())
                                    .toString(),
                              );
                              final provider = Provider.of<ProviderApi>(context,
                                  listen: false);
                              provider.addOrdo(ord: ord);
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
                );
              },
            ),
          );
  }

  void clearFields() {
    posologie.clear();
    ordonance.clear();
  }
}

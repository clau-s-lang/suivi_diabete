import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../menus/pageMenuMedecin.dart';

class DonneesDuPatient extends StatefulWidget {
  final String idSigne;

  const DonneesDuPatient({Key? key, required this.idSigne}) : super(key: key);

  @override
  _DonneesDuPatientState createState() => _DonneesDuPatientState();
}

class _DonneesDuPatientState extends State<DonneesDuPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuMedecin(),
        appBar: AppBar(
          title: Text('Description d\'un cahier de charge'),
          backgroundColor: Color(0xFF216DAD),
        ),
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('SigneVitaux')
                .doc(widget.idSigne)
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

              print(widget.idSigne);
              if (!snapshot.hasData) {
                return Material(
                  child: Center(
                    child: Text('Pas de données'),
                  ),
                );
              }
              DocumentSnapshot doc = snapshot.data!;
              return ListView(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFFE8F0FE),
                          backgroundImage: AssetImage('images/glycemia.png'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                          'Glycémie',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ), //Titres dossier Med
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        margin: EdgeInsets.only(left: 20),
                        child: Center(child: Text('Glycémie')),
                      ),
                      Container(
                        width: 200,
                        height: 40,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 10),
                        color: Color(0xFFE8F0FE),
                        child: Text(doc['glycemie'] + '  g/l'),
                      ),
                    ],
                  ),//glycemie
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFFE8F0FE),
                          backgroundImage: AssetImage('images/insulinia.png'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                          'Insuline',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ), //Titres dossier Med
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        margin: EdgeInsets.only(left: 20),
                        child: Center(child: Text('Insuline basale')),
                      ),
                      Container(
                        width: 200,
                        height: 40,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 10),
                        color: Color(0xFFE8F0FE),
                        child: Text(doc['insulinebasale'] + '  U'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        margin: EdgeInsets.only(left: 20),
                        child: Center(child: Text('Insuline bolus')),
                      ),
                      Container(
                        width: 200,
                        height: 40,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 10),
                        color: Color(0xFFE8F0FE),
                        child: Text(doc['insulineBolus'] + '  U'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        margin: EdgeInsets.only(left: 20),
                        child: Center(child: Text('Insuline de correction')),
                      ),
                      Container(
                        width: 200,
                        height: 40,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 10),
                        color: Color(0xFFE8F0FE),
                        child: Text(doc['insulineDeCorrection'] + '  U'),
                      ),
                    ],
                  ), //insuline
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFFE8F0FE),
                          backgroundImage: AssetImage('images/food.png'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                          'Nourriture',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ), //Titres dossier Med
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        margin: EdgeInsets.only(left: 20),
                        child: Center(child: Text('Glucide')),
                      ),
                      Container(
                        width: 200,
                        height: 40,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 10),
                        color: Color(0xFFE8F0FE),
                        child: Text(doc['glycemie'] + '  g'),
                      ),
                    ],
                  ),//food
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFFE8F0FE),
                          backgroundImage: AssetImage('images/sporty.png'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                          'Activité physique',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ), //Titres dossier Med
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        margin: EdgeInsets.only(left: 20),
                        child: Center(child: Text('Activité physique')),
                      ),
                      Container(
                        width: 200,
                        height: 40,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 10),
                        color: Color(0xFFE8F0FE),
                        child: Text(doc['activitePhysique']),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        margin: EdgeInsets.only(left: 20),
                        child: Center(child: Text('Durée')),
                      ),
                      Container(
                        width: 200,
                        height: 40,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 10),
                        color: Color(0xFFE8F0FE),
                        child: Text(doc['duree']),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        margin: EdgeInsets.only(left: 20),
                        child: Center(child: Text('Nombre de pas')),
                      ),
                      Container(
                        width: 200,
                        height: 40,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 10),
                        color: Color(0xFFE8F0FE),
                        child: Text(doc['nbreDePas']),
                      ),
                    ],
                  ), //sport
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFFE8F0FE),
                          backgroundImage: AssetImage('images/stress.PNG'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                          'Contexte',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ), //Titres dossier Med
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        margin: EdgeInsets.only(left: 20),
                        child: Center(child: Text('Contexte')),
                      ),
                      Container(
                        width: 200,
                        height: 40,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 10),
                        color: Color(0xFFE8F0FE),
                        child: Text(doc['contexteMaladie']),
                      ),
                    ],
                  ),//contexte
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFFE8F0FE),
                          backgroundImage: AssetImage('images/occaz.png'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                          'Occasionnel',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ), //Titres dossier Med
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        margin: EdgeInsets.only(left: 20),
                        child: Center(child: Text('Poids')),
                      ),
                      Container(
                        width: 200,
                        height: 40,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 10),
                        color: Color(0xFFE8F0FE),
                        child: Text(doc['poids'] + '  Kg'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        margin: EdgeInsets.only(left: 20),
                        child: Center(child: Text('HbA1c')),
                      ),
                      Container(
                        width: 200,
                        height: 40,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 10),
                        color: Color(0xFFE8F0FE),
                        child: Text(doc['hbA1c'] + '  %'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        margin: EdgeInsets.only(left: 20),
                        child: Center(child: Text('PA Syst.')),
                      ),
                      Container(
                        width: 200,
                        height: 40,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 10),
                        color: Color(0xFFE8F0FE),
                        child: Text(doc['pressionArterielleSyst'] + '  mmHg'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        margin: EdgeInsets.only(left: 20),
                        child: Center(child: Text('PA diast.')),
                      ),
                      Container(
                        width: 200,
                        height: 40,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 10),
                        color: Color(0xFFE8F0FE),
                        child: Text(doc['pressionArterielleDiast'] + '  mmHg'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFFE8F0FE),
                          backgroundImage: AssetImage('images/rema.png'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5, bottom: 5),
                        child: Text(
                          'Remarque',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ), //Titres dossier Med
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 65,
                        margin: EdgeInsets.only(left: 20),
                        child: Center(child: Text('Remarque')),
                      ),
                      Container(
                        width: 200,
                        height: 200,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 10),
                        color: Color(0xFFE8F0FE),
                        child: Text(doc['glycemie'] + '  g/l'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                ],
              );
            }));
  }
}

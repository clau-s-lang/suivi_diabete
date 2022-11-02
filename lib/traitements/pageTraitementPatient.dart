import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/tiles/traitement_tile.dart';

class TraitementPatient extends StatefulWidget {
  final String idOrd;

  const TraitementPatient({Key? key, required this.idOrd}) : super(key: key);
  @override
  _TraitementPatientState createState() => _TraitementPatientState();
}

class _TraitementPatientState extends State<TraitementPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details du traitement'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Traitement')
              .doc(widget.idOrd)
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

            print(widget.idOrd);
            if (!snapshot.hasData) {
              return Material(
                child: Center(
                  child: Text('Pas de données'),
                ),
              );
            }
            DocumentSnapshot doc = snapshot.data!;
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return traitementTile(
                  designation: doc['designation'],
                  posologie: doc['posologie'],
                  datedeFin: doc['datedeFin'],
                );
              },
              /*  children: [
              Column(
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
                  Container(
                    child: Center(
                      child: Text(
                        'Les médicaments en cours...',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.only(left: 30,right: 30),
                    child: Card(
                      color: Color(0xFFE8F0FE),
                      child: Column(
                        children: [
                          Container(
                            //height: 100,
                            padding: EdgeInsets.only(left: 15, top: 10),
                            // margin: EdgeInsets.only(left: 30, right: 30),
                            width: 300,
                            child: const Text(
                              'Paracétamol',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            // margin: EdgeInsets.only(left: 30, right: 30),
                            width: 300,
                            child: const Text(
                              'Duree restant',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            //height: 100,
                            padding: EdgeInsets.only(left: 15, bottom: 10),
                            // margin: EdgeInsets.only(left: 30, right: 30),
                            width: 300,
                            child: const Text(
                              '3jours',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.only(left: 30,right: 30),
                    child: Card(
                      color: Color(0xFFE8F0FE),
                      child: Column(
                        children: [
                          Container(
                            //height: 100,
                            padding: EdgeInsets.only(left: 15, top: 10),
                            // margin: EdgeInsets.only(left: 30, right: 30),
                            width: 300,
                            child: const Text(
                              'Anaflam',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            // margin: EdgeInsets.only(left: 30, right: 30),
                            width: 300,
                            child: const Text(
                              'Duree restant',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            //height: 100,
                            padding: EdgeInsets.only(left: 15, bottom: 10),
                            // margin: EdgeInsets.only(left: 30, right: 30),
                            width: 300,
                            child: const Text(
                              '10jours',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],*/
            );
          }),
    );
  }
}

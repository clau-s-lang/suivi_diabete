import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Reusables/AjoutSuppression.dart';
import '../Reusables/EspaceVerticale.dart';
import '../Reusables/IdentifiantOrdonance.dart';
import '../menus/pageMenuMedecin.dart';

class ViewOrdonnanceMed extends StatefulWidget {
  final String ordonnanceId;

  const ViewOrdonnanceMed({Key? key, required this.ordonnanceId})
      : super(key: key);
  @override
  _ViewOrdonnanceMedState createState() => _ViewOrdonnanceMedState();
}

class _ViewOrdonnanceMedState extends State<ViewOrdonnanceMed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuMedecin(),
      appBar: AppBar(
        title: Text('Description d\'une ordonnance médicale'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Ordonnance')
              .doc(widget.ordonnanceId)
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

            print(widget.ordonnanceId);
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 100),
                          child: Text('Patient : '),
                        ),
                        Container(
                          child: Text('Hope'),
                          /*StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Patient')
                                .where('idOrdonnance', isEqualTo: widget.ordonnanceId)
                                .snapshots(),
                            builder: (context, snapshot) {
                              return Text('');
                            },
                          ),*/
                        ),
                      ],
                    ),
                    /*IdOrdonnance(
                      variable: 'Patient : ',
                      valeur: 'Claudette Vanzirwe',
                    ),*/
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
                    IdOrdonnance(variable: 'Date : ', valeur: '24/08/2022'),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                          '------------------------------------------------------------------------------------'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Card(
                    color: Color(0xFFE8F0FE),
                    child: Column(
                      children: [
                        Container(
                          //height: 100,
                          padding: EdgeInsets.only(left: 15, top: 10),
                          // margin: EdgeInsets.only(left: 30, right: 30),
                          width: 300,
                          child: Text(
                            doc['designation'],
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          // margin: EdgeInsets.only(left: 30, right: 30),
                          width: 300,
                          child: const Text(
                            'Posologie',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          //height: 100,
                          padding: EdgeInsets.only(left: 15, bottom: 10),
                          // margin: EdgeInsets.only(left: 30, right: 30),
                          width: 300,
                          child: Text(
                            doc['posologie'],
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 200),
                  child: AjoutSuppression(
                    icone: Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 15,
                    ),
                    designation: 'Confirmer',
                    couleur: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    IdOrdonnance(
                        variable: 'Médecin : ', valeur: 'Queen Mughole'),
                    SizedBox(
                      height: 10,
                    ),
                    IdOrdonnance(variable: 'Signature : ', valeur: 'signature')
                  ],
                ),
                EspaceVerticale(),
              ],
            );
          }),
    );
  }
}

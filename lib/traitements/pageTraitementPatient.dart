import 'package:flutter/material.dart';

class TraitementPatient extends StatefulWidget {
  @override
  _TraitementPatientState createState() => _TraitementPatientState();
}

class _TraitementPatientState extends State<TraitementPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
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
            ],
          ),
        ],
      ),
    );
  }
}

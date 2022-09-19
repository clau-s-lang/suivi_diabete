import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Reusables/AjoutSuppression.dart';
import '../Reusables/EspaceVerticale.dart';
import '../Reusables/IdentifiantOrdonance.dart';

class OrdonnancePatient extends StatefulWidget {
  @override
  _OrdonnancePatientState createState() => _OrdonnancePatientState();
}

class _OrdonnancePatientState extends State<OrdonnancePatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                      'Posologie',
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
                      '2x3Co',
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
          SizedBox(height: 5,),
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
                      'Posologie',
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
                      '2x3Co',
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
          SizedBox(height: 5,),
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
                      'Posologie',
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
                      '2x3Co',
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
          SizedBox(height: 5,),
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
                      'Posologie',
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
                      '2x3Co',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          EspaceVerticale(),
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
          SizedBox(height: 5,),
          Column(
            children: [
              IdOrdonnance(variable: 'Médecin : ', valeur: 'Queen Mughole'),
              SizedBox(
                height: 10,
              ),
              IdOrdonnance(variable: 'Signature : ', valeur: 'signature')
            ],
          ),
          EspaceVerticale(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gestion_diabete/pages/pageInscriptionPatient.dart';

class PageAccueil extends StatefulWidget {
  @override
  _PageAccueilState createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: 300,
                padding: EdgeInsetsDirectional.only(top:20, bottom: 10,),
               // margin: EdgeInsets.all(20),
                child: Text(
                  'Bienvenue sur l\'application E-Diab Care',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 10, bottom: 20),
                child: Image.asset('images/AccueilGluco2.PNG'),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)
                  {
                    return InscriptionPatient();
                  }));
                },
                child: Container(
                  height: 80,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Color(0xFFA2CCF9),
                  ),
                  child: Center(
                    child: Text(
                      'Continuer',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
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

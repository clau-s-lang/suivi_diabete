import 'package:flutter/material.dart';

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
                padding: EdgeInsetsDirectional.only(top:20, bottom: 20,),
               // margin: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'Bienvenue sur l\'application E-Diab Care',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 20, bottom: 20),
                child: Center(
                  child: Text(
                    'Hey! Bienvenu sur votre compagnon sanitaire. '
                        'Nous vous proposons une alternative de suivi facile de '
                        'votre diabète ',
                    style: TextStyle(
                      fontSize: 20 ,
                      fontWeight: FontWeight.bold,
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

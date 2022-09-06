import 'package:flutter/material.dart';
import 'package:gestion_diabete/modeles/modelMessage.dart';

class CardDeChat extends StatelessWidget {
  CardDeChat({
    required this.Nom,
    required this.profil,
    required this.message,
    required this.heure,
    required this.nombreMessage,
  }) ;
  
  String Nom, profil, message, heure, nombreMessage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                /*margin: EdgeInsets.symmetric(
                    vertical: 5.0, horizontal: 10.0),*/
                padding: EdgeInsets.all(5.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.lightBlueAccent[200],
                   backgroundImage: AssetImage(profil),
                   /*Icon(
                    Icons.business_center_rounded,
                    color: Colors.white,
                    size: 15.0,
                  ),*/
                ),
              ),
            ],
          ),
          SizedBox(width: 5,),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Nom,
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(
                  height: 3.0,
                ),
                Container(
                  width: 150.0,
                  child: Text(
                    message,
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 85.0),
          Column(
            children: [
              Container(
                height: 30.0,
                width: 50.0,
                /* margin: EdgeInsets.symmetric(
                    vertical: 0.0, horizontal: 5.0),*/
                padding: EdgeInsets.all(5.0),
                child: Text(
                  heure,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 30.0,
                width: 30.0,
                /* margin: EdgeInsets.symmetric(
                    vertical: 0.0, horizontal: 5.0),*/
                padding: EdgeInsets.all(5.0),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.green,
                  child:Text(
                    nombreMessage,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
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

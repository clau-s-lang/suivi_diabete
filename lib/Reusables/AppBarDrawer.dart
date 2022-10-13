import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MenuHeader extends StatelessWidget {
  MenuHeader({
    required this.ident,
    required this.noms,
    required this.profil,
  });

  String ident, noms, profil;

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'E-Diab Care',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35,
                child: Icon(Icons.account_circle_outlined),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    noms,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    ident,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xFF216DAD),
      ),
    );
  }
}

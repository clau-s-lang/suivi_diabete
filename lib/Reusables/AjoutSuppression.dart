import 'package:flutter/material.dart';

class AjoutSuppression extends StatelessWidget {
  AjoutSuppression({
    required this.icone,
    required this.designation,
    required this.couleur,

  });

  Icon icone;
  String designation;
  Color couleur;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        padding: EdgeInsets.only(left: 40, right: 5),
        child: Row(
          children: [
            icone,
            Container(
              child: Text(
                designation,
                style: TextStyle(
                  color: couleur,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
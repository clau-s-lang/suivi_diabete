import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  ReusableButton({
    required this.text,
    required this.ToPage,
    required this.dim,
    //required this.nom,
  });

  String text;
  Widget ToPage;
  double dim;
  //TextEditingController? nom;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //final name = nom.text;
        Navigator.push(context,MaterialPageRoute(builder: (context)
        {
          return ToPage;
        }));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 50,
        width: dim,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color(0xFFA2CCF9),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
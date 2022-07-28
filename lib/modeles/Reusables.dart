import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/pageInscriptionMedecin.dart';


// Icone de retour en arriere

class ReusableRetour extends StatelessWidget {
  const ReusableRetour({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(top: 15, bottom: 10, start: 5, end: 310),
      child: Icon(Icons.arrow_back_ios),
    );
  }
}

// containeur des titres des pages

class ReusableMenuName extends StatelessWidget {
  ReusableMenuName(this.text);

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsetsDirectional.only(top: 20, bottom: 10, start: 10),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }
}

// les champs à completer

class ReusableTextFormField extends StatelessWidget {
  ReusableTextFormField({
    required this.name,
    required this.hint,
    required this.label,
    required this.message,
    required this.icone,
  });

  final TextEditingController name;
  String message, label, hint;
  IconData icone;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      child: TextFormField(
        controller: name,
        style: TextStyle(
        fontSize: 15,
        height: 0.5,
      ),
        validator: (value) =>
            value == null ? message : null,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(icone,
          size: 30.0, color: Color(0xFFA2CCF9),),
          border: OutlineInputBorder(),
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}

// bouton de confirmation

class ReusableButton extends StatelessWidget {
  ReusableButton({
    required this.text,
    required this.ToPage,
  });

  String text;
  Widget ToPage;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)
        {
          return ToPage;
        }));
      },
      child: Container(
        height: 50,
        width: 300,
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


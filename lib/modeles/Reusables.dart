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

// En tete des menus

class MenuHeader extends StatelessWidget {
  MenuHeader({
    required this.ident,
    required this.noms,
    required this.profil,
  }) ;

  String ident, noms,profil;


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
                backgroundImage: AssetImage(profil),
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
                  SizedBox(height: 5,),
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
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/AccueilGluco2.PNG'))),
    );
  }
}

// Denomination des menus

class MenuNames extends StatelessWidget {
  MenuNames({
    required this.designation,
    required this.icone,
    required this.ToPage,
  });

  String designation;
  Icon icone;
  Widget ToPage;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icone,
      title: Text(designation),
      onTap: () => {
      Navigator.push(context,MaterialPageRoute(builder: (context)
      {
      return ToPage;
      })),
    },
    );
  }
}

// plage identifiant de completion des donnees

class PlageDeDonnees extends StatelessWidget {
  PlageDeDonnees({
    required this.designation,
    required this.icone,
  });

  String designation;
  Icon icone;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFE8F0FE),
      ),
      height: 50,
      width: 330,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icone,
          SizedBox(width: 5,),
          Text(
            designation,
            style: TextStyle(
              color: Color(0xFF216DAD),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// champ pour completer les donnees

class ReusableTextFormFieldData extends StatelessWidget {
  ReusableTextFormFieldData({
    required this.name,
    required this.hint,
    required this.label,
    required this.message,

  });

  final TextEditingController name;
  String message, label, hint;


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
          border: OutlineInputBorder(),
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}


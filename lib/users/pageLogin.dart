import 'package:flutter/material.dart';
import 'package:gestion_diabete/api/apiProvider.dart';
//import 'package:gestion_diabete/pages/pageDataPatient.dart';
import 'pageInscriptionPatient.dart';
//import 'package:gestion_diabete/pages/pageMenuPatient.dart';
import '../dashboards/pageDashboardMedecin.dart';
import 'package:provider/provider.dart';

import '../Reusables/BoutonDeConfimation.dart';
import '../Reusables/ChampsIdentifiants.dart';
import '../Reusables/Icone de retour.dart';
import '../Reusables/ChampdeRedactionMessage.dart';
import '../Reusables/TitreSansAppBar.dart';

class Connexion extends StatefulWidget {
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final email = TextEditingController();
  final Mdp = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        body: ListView(
          children: [
            ReusableRetour(),
            ReusableMenuName(
              'Connexion',
            ),
            SizedBox(
              height: 80,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  ReusableTextFormField(
                    name: email,
                    type: TextInputType.emailAddress,
                    message: 'Ce champ est obligatoire',
                    label: 'Email',
                    hint: 'Exemple@gmail.com',
                    icone: (Icons.mail_outlined),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 330,
                    child: TextFormField(
                      controller: Mdp,
                      style: TextStyle(
                        fontSize: 15,
                        height: 0.5,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Obligatoire';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon(isVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Mot de passe',
                        hintText: 'Completer votre mot de passe',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        'Mot de passe oublié?',
                        style: TextStyle(
                          color: Color(0xFFA2CCF9),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final provider =
                          Provider.of<ProviderApi>(context, listen: false);
                      provider.signInWithEmail(
                          email: email.text,
                          password: Mdp.text,
                          );
                      Center(
                        child: CircularProgressIndicator(),
                      );

                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Color(0xFFA2CCF9),
                      ),
                      child: Center(
                        child: Text(
                          'Se Connecter',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  /* ReusableButton(
                    text: 'Se Connecter',
                    ToPage: DonneesPatient(),
                    dim: 300,
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

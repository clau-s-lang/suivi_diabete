//import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gestion_diabete/modeles/modelPatient.dart';
import 'pageInscriptionMedecin.dart';
import 'pageLogin.dart';
import '../dashboards/pageDashboardMedecin.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Reusables/BoutonDeConfimation.dart';
import '../Reusables/ChampsIdentifiants.dart';
import '../Reusables/Icone de retour.dart';
import '../Reusables/ChampdeRedactionMessage.dart';
import '../Reusables/TitreSansAppBar.dart';
import '../api/apiProvider.dart';
import '../widget/snackbar_widget.dart';

class InscriptionPatient extends StatefulWidget {
  @override
  _InscriptionPatientState createState() => _InscriptionPatientState();
}

class _InscriptionPatientState extends State<InscriptionPatient> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final prenom = TextEditingController();
  final genre = TextEditingController();
  final adresse = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final code = TextEditingController();
  final MdP = TextEditingController();
  final confimMdP = TextEditingController();
  final admittedDate = TextEditingController();
  bool isVisible = true;
  bool loading = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  final items = ['Masculin', 'Feminin', 'Genre'];
  String? value = 'Genre';

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            ReusableRetour(),
            ReusableMenuName('Inscription du patient'),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                ReusableTextFormField(
                  name: name,
                  type: TextInputType.name,
                  message: 'Ce champ est obligatoire',
                  label: 'Nom',
                  hint: 'Completer votre nom',
                  icone: (Icons.account_circle_outlined),
                ),
                SizedBox(
                  height: 10,
                ),
                ReusableTextFormField(
                  name: prenom,
                  type: TextInputType.name,
                  message: 'Ce champ est obligatoire',
                  label: 'Prenom',
                  hint: 'Completer votre prenom',
                  icone: (Icons.account_circle_outlined),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: value,
                      isExpanded: true,
                      iconSize: 36,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() {
                        this.value = value;
                      }),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ReusableTextFormField(
                  name: adresse,
                  type: TextInputType.text,
                  message: 'Ce champ est obligatoire',
                  label: 'Adresse',
                  hint: 'Q.Keshero, Av.Ngobobo, Com. Goma',
                  icone: (Icons.location_on_outlined),
                ),
                SizedBox(
                  height: 10,
                ),
                ReusableTextFormField(
                  name: phone,
                  type: TextInputType.phone,
                  message: 'Ce champ est obligatoire',
                  label: 'Téléphone',
                  hint: '09707129016',
                  icone: (Icons.phone_outlined),
                ),
                SizedBox(
                  height: 10,
                ),
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
                    controller: admittedDate,
                    style: TextStyle(
                      fontSize: 15,
                      height: 0.5,
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime.now());
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          admittedDate.text = formattedDate;
                        });
                      } else {
                        snackBarWidget(context,
                            message: "La date n'est pas selectioné");
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.calendar_today_outlined,
                        size: 30.0,
                        color: Color(0xFFA2CCF9),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Date d\'inscription',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ReusableTextFormField(
                  name: MdP,
                  type: TextInputType.visiblePassword,
                  message: 'Ce champ est obligatoire',
                  label: 'Mot de passe',
                  hint: 'Completer votre mot de passe',
                  icone: (Icons.password_outlined),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 330,
                  child: TextFormField(
                    controller: confimMdP,
                    style: TextStyle(
                      fontSize: 15,
                      height: 0.5,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Obligatoire';
                      }
                      if (value != MdP.text) {
                        return 'Mot de passe different';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password_outlined,
                        size: 30.0,
                        color: Color(0xFFA2CCF9),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Confirmer mot de passe',
                      hintText: 'Completer le meme mot de passe',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
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
                          'Enregistrer',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      final pat = Patient(
                        fname: name.text,
                        sname: prenom.text,
                        genre: genre.text,
                        adresse: adresse.text,
                        medecinId: auth.currentUser!.uid,
                        email: email.text,
                        password: MdP.text,
                        numPhone: phone.text,
                        admittedDate: admittedDate.text,
                      );
                      if (_formKey.currentState!.validate()) {
                        final provider =
                            Provider.of<ProviderApi>(context, listen: false);
                        provider.addPatient(
                          patient: pat,
                        );
                        const snackBar = SnackBar(
                          content: Text('Un nouveau patient a été ajouté'),
                        );
                        clearFields();
                        provider.logOut();
                        Navigator.pop(context);
                      }
                    }
                    //final name = nom.text;

                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void clearFields() {
    name.clear();
    prenom.clear();
    genre.clear();
    phone.clear();
    email.clear();
    MdP.clear();
    confimMdP.clear();
    code.clear();

    setState(() {
      loading = false;
    });
  }
}

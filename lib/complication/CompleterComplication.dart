import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/modeles/modelComplication.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../api/apiProvider.dart';
import '../menus/pageMenuMedecin.dart';
import '../widget/pageloading.dart';
import '../widget/snackbar_widget.dart';

class AjoutComplication extends StatefulWidget {
  final String patientId;

  const AjoutComplication({Key? key, required this.patientId}) : super(key: key);

  @override
  _AjoutComplicationState createState() => _AjoutComplicationState();
}

class _AjoutComplicationState extends State<AjoutComplication> {
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;
  final designation = TextEditingController();
  final date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            drawer: MenuMedecin(),
            appBar: AppBar(
              title: Text('Ajouter une complication'),
              backgroundColor: Color(0xFF216DAD),
            ),
            body: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) =>
                          value == null || value.isEmpty  ? 'Vous ne pouvez pas envoyer un formulaire vide' : null,
                          controller: designation,
                          style: TextStyle(
                            fontSize: 15,
                            height: 0.5,
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Ex: Neuropathie',
                            hintText: 'Entrez le nom de la complication decouverte',
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      /*TextFormField(
                        validator: (value) =>
                        value == null || value.isEmpty  ? 'Vous ne pouvez pas envoyer un formulaire vide' : null,
                        controller: date,
                        style: TextStyle(
                          fontSize: 15,
                          height: 0.5,
                        ),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Ex: ',
                          hintText: 'Entrez le nom de la complication decouverte',
                        ),
                      ),*/
                      Container(
                        width: 330,
                        child: TextFormField(
                          controller: date,
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
                                date.text = formattedDate;
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
                            labelText: 'Date de decouverte de la complication',
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
                            final comp = Complication(
                              designation: designation.text,
                                dateDecouverte: date.text,
                            );
                            if (_formKey.currentState!.validate()) {
                              final provider =
                              Provider.of<ProviderApi>(context, listen: false);
                              provider.addCompl(
                                comp: comp, patientId: widget.patientId,
                              );
                              const snackBar = SnackBar(
                                content: Text('Une nouvelle complication a été ajoutée'),
                              );
                              //clearFields();
                              snackBar;
                              Navigator.pop(context);
                              //provider.logOut();
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
}

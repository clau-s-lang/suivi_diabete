import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'pageLogin.dart';
import '../dashboards/pageDashboardMedecin.dart';
import '../widget/pageloading.dart';
import 'package:provider/provider.dart';
import '../Reusables/BoutonDeConfimation.dart';
import '../Reusables/ChampsIdentifiants.dart';
import '../Reusables/Icone de retour.dart';
import '../Reusables/ChampdeRedactionMessage.dart';
import '../Reusables/TitreSansAppBar.dart';
import '../api/apiProvider.dart';
import '../modeles/modelMedecin.dart';

class InscriptionMedecin extends StatefulWidget {
  @override
  _InscriptionMedecinState createState() => _InscriptionMedecinState();
}

class _InscriptionMedecinState extends State<InscriptionMedecin> {
  final name = TextEditingController();
  final postnom = TextEditingController();
  final genre = TextEditingController();
  final specialite = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final clinique = TextEditingController();
  final MdP = TextEditingController();
  final confirmMdP = TextEditingController();

  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading
        ?  Loading()
        : Scaffold(
            body: ListView(
              children: [
                ReusableRetour(),
                ReusableMenuName(
                  'Inscription du medecin',
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
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
                        name: postnom,
                        type: TextInputType.name,
                        message: 'Ce champ est obligatoire',
                        label: 'Prenom',
                        hint: 'Completer votre postnom',
                        icone: (Icons.account_circle_outlined),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ReusableTextFormField(
                        name: genre,
                        type: TextInputType.text,
                        message: 'Ce champ est obligatoire',
                        label: 'Genre',
                        hint: 'Choisissez votre genre',
                        icone: (Icons.account_circle_outlined),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ReusableTextFormField(
                        name: specialite,
                        type: TextInputType.text,
                        message: 'Ce champ est obligatoire',
                        label: 'Specialisation',
                        hint: 'Completer votre specialisation',
                        icone: (Icons.medical_services_outlined),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ReusableTextFormField(
                        name: clinique,
                        message: 'Ce champ est obligatoire',
                        type: TextInputType.text,
                        label: 'Clinique',
                        hint: 'Completer votre clinique',
                        icone: (Icons.local_hospital_outlined),
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
                      /* ReusableTextFormField(
                  name: confirmMdP,
                  type: TextInputType.visiblePassword,
                  message: 'Ce champ est obligatoire',
                  label: 'Confirmer mot de passe',
                  hint: 'Completer le meme mot de passe',
                  icone: (Icons.password_outlined),

                ),*/
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 330,
                        child: TextFormField(
                          controller: confirmMdP,
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
                     /* ReusableButton(
                        //nom: name,
                        text: 'S\'inscrire',
                        ToPage: Connexion(),
                        dim: 300,
                      ),*/
                      GestureDetector(
                        onTap: () async{
                          if(_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                            try{
                              setState(() {
                                loading =true;
                              });
                              final med = Medecin(
                                fname: name.text,
                                sname: postnom.text,
                                genre: genre.text,
                                specialisation: specialite.text,
                                numPhone: phone.text,
                                password: MdP.text,
                                email: email.text,
                                clinique: clinique.text,
                              );
                              final provider =
                                  Provider.of<ProviderApi> (context, listen: false);
                              provider.signUpWithEmail(
                                  email: email.text,
                                  password: MdP.text,
                                  medecin: med,
                              );
                            } catch (e) {
                              Fluttertoast.showToast(msg: e.toString());
                              setState(() {
                                loading = false;
                              });
                            }
                            clearFields();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return Connexion();
                                }));
                          }
                          //final name = nom.text;

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
                              'S\'inscrire',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  void clearFields() {
    name.clear();
    postnom.clear();
    genre.clear();
    specialite.clear();
    phone.clear();
    email.clear();
    clinique.clear();
    MdP.clear();
    confirmMdP.clear();

    setState(() {
      loading = false;
    });
  }
}

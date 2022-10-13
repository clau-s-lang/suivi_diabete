import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gestion_diabete/api/apiProvider.dart';
import 'package:gestion_diabete/menus/pageMenuPatient.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class EditProfilPat extends StatefulWidget {
  @override
  _EditProfilPatState createState() => _EditProfilPatState();
}

class _EditProfilPatState extends State<EditProfilPat> {
  final _formKey = GlobalKey<FormState>();
  bool isLoaded = false;
  String imgUrl ='';
  File? _image;
  User? user = FirebaseAuth.instance.currentUser;

  Future<String> _downloadLink(firebase_storage.Reference ref) async {
    final link = await ref.getDownloadURL();
    return link;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuPatient(),
      appBar: AppBar(
        title: Text('Editer le profil'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body:  Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(20),
            child: isLoaded
                ? Column(
              children: [
                Image.file(
                  _image!,
                  height: 150,
                ),
                OutlinedButton.icon(
                    onPressed: () async {
                      await _image!.delete();
                      setState(() {
                        isLoaded = false;
                      });
                    },
                    icon: Icon(Icons.delete),
                    label: Text('Remove Image')),
              ],
            )
                : InkWell(
              child: Placeholder(
                color: Colors.transparent,
                child: CircleAvatar(
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.white70,
                    size: 75,
                  ),
                  backgroundColor: Colors.grey,
                  radius: 35,
                ),
                fallbackHeight: 150,
                fallbackWidth: 150,
              ),
              onTap: () async {
                final pickedFile = await ImagePicker().getImage(
                  source: ImageSource.gallery,
                  maxHeight: 150,
                  maxWidth: 150,
                  imageQuality: 100,
                );
                if (pickedFile != null) {
                  setState(() {
                    _image = File(pickedFile.path);
                    isLoaded = true;
                  });
                }
              },
            ),
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 2, color: Color(0xFF216DAD))),
                      onPressed: () => Navigator.pop(context),
                      child: Text('Annuler'),
                    )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: MaterialButton(
                    elevation: 0,
                    textColor: Colors.white,
                    color: Color(0xFF216DAD),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        String fileName = basename(_image!.path);

                        try {
                          firebase_storage.Reference firebaseStorageRef =
                          firebase_storage.FirebaseStorage.instance
                              .ref()
                              .child('$fileName');

                          firebase_storage.UploadTask uploadTask =
                          firebaseStorageRef.putFile(_image!);
                          TaskSnapshot taskSnap = await uploadTask;
                          imgUrl = await taskSnap.ref.getDownloadURL();

                          addProfilPicture(context).whenComplete(() {
                            return ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Submitted Successfully'),
                              ),
                            );
                          });
                        } on FirebaseException catch (error) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('$error')));
                        }
                      }
                      Navigator.pop(context);
                    },
                    child: Text('Ajouter la photo'),
                  ),
                ),
              ],
            )
          ]
        ),
      ),
    );
  }

  addProfilPicture(BuildContext context) async{
    final provider = Provider.of<ProviderApi>(context, listen: false);
    await provider.addProfil(
      imgUrl: imgUrl,
    );
  }
}

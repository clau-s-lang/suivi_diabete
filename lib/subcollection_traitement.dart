import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService{
  User? user = FirebaseAuth.instance.currentUser;
  void insertTraitement() async{
    var db = FirebaseFirestore.instance.collection('Patient');

    db
        .doc(user!.uid)
        .collection('Traitement')
        .add({"idTraitement": true});
  }
}


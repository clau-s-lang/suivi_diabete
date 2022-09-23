import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/api/apiProvider.dart';
import 'package:gestion_diabete/wrapper.dart';
import 'package:provider/provider.dart';
import 'widget/pageAccueil.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SuiviDiabete());
   /* MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: SuiviDiabete(),
    ),
  );*/
}

class SuiviDiabete extends StatefulWidget {
  @override
  _SuiviDiabeteState createState() => _SuiviDiabeteState();
}

class _SuiviDiabeteState extends State<SuiviDiabete> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProviderApi(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
            home: Wrapper(),
        ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_diabete/api/apiProvider.dart';
import 'package:provider/provider.dart';
import '../notes/pageNoteMedecin.dart';
import '../Reusables/AppBarDrawer.dart';
import '../Reusables/DenominationMenus.dart';

class MenuMedecin extends StatefulWidget {

  @override
  _MenuMedecinState createState() => _MenuMedecinState();
}

class _MenuMedecinState extends State<MenuMedecin> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          MenuHeader(
            ident: 'Néphrologue',
            noms: 'Queen Mughole',
            profil: 'images/clau.jpg',
          ),
          MenuNames(
            designation: 'Notes',
            icone: Icon(Icons.feed_outlined),
            ToPage: NotesMedecin(),
          ),
          MenuNames(
            designation: 'Paramètres',
            icone: Icon(Icons.settings_outlined),
            ToPage: NotesMedecin(),
          ),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Déconnexion', style: TextStyle(fontSize: 15),),
              onTap: () {
                final provider =
                    Provider.of<ProviderApi>(context, listen: false);
                provider.logOut();
              }),
        ],
      ),
    );
  }
}

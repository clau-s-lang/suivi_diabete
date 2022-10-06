import 'package:flutter/material.dart';

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
      title: Text(designation,
      style: TextStyle(
        fontSize: 15,
      ),),
      onTap: () => {
        Navigator.push(context,MaterialPageRoute(builder: (context)
        {
          return ToPage;
        })),
      },
    );
  }
}
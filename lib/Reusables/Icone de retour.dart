import 'package:flutter/material.dart';

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
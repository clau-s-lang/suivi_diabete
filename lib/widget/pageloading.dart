import 'package:flutter/material.dart';
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
       child: Center(child: CircularProgressIndicator())
    );
  }
}


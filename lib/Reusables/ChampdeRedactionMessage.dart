import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewMessageWidget extends StatelessWidget {
  const NewMessageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: TextField(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(12),
          hintText: 'Tapez votre message...',
        ),

      ),
    );
  }
}
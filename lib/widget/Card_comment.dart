import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget commentCard({
  String? imgUrl,
String? sender,
String? message,
DateTime? date,
}){
  final time = DateTime.now().difference(date!);
  return ListTile(
    title: Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$sender'),
          Text(time.inMinutes<= 59
          ? '${time.inMinutes} min ago'
              :time.inHours == 1
              ? '${time.inHours} hour ago'
              :time.inDays<= 1
              ? '${time.inHours} hours ago'
              : '${time.inDays} days ago',
            style: TextStyle(color:Colors.grey, fontSize: 12 )
          )

        ],
      ),
    ),
    subtitle: Text(message!),
  );
}
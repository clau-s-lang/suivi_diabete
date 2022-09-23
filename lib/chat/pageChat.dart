import 'package:flutter/material.dart';
import '../Reusables/ChampdeRedactionMessage.dart';
//import 'package:gestion_diabete/pages/pageMenuPatient.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../menus/pageMenuPatient.dart';

class Messagerie extends StatefulWidget {
  @override
  _MessagerieState createState() => _MessagerieState();
}

class _MessagerieState extends State<Messagerie> {
  List<Message> messages = [
    Message(
      text: 'cool aussi',
      date: DateTime.now().subtract(Duration(days:1, minutes: 3)),
      isSentByMe: true,
    ),
    Message(
      text: 'Super bien. Toi?',
      date: DateTime.now().subtract(Duration(days:1, minutes: 3)),
      isSentByMe: false,
    ),
    Message(
      text: 'Salut de moi. la soiree c comment?',
      date: DateTime.now().subtract(Duration(days:1, minutes: 3)),
      isSentByMe: true,
    ),
    Message(
      text: 'Bonsoir de moi',
      date: DateTime.now().subtract(Duration(days:1, minutes: 3)),
      isSentByMe: false,
    ),
    Message(
      text: 'Genial',
      date: DateTime.now().subtract(Duration(days:2, minutes: 3)),
      isSentByMe: true,
    ),
    Message(
      text: 'Ne t\'inquite pas, je dirai ce soir',
      date: DateTime.now().subtract(Duration(days:2, minutes: 3)),
      isSentByMe: false,
    ),
    Message(
      text: 'Oui oui ca va. la suite du coop?',
      date: DateTime.now().subtract(Duration(days:3, minutes: 3)),
      isSentByMe: true,
    ),
    Message(
      text: 'Je vais bien. et toi ca va?',
      date: DateTime.now().subtract(Duration(days:3, minutes: 3)),
      isSentByMe: false,
    ),
    Message(
      text: 'Bonjour Melchior. Comment vas-tu?',
      date: DateTime.now().subtract(Duration(days:3, minutes: 3)),
      isSentByMe: true,
    ),
    Message(
      text: 'Bonjour Clau',
      date: DateTime.now().subtract(Duration(days:3, minutes: 3)),
      isSentByMe: false,
    ),
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuPatient(),
      appBar: AppBar(
        title: Text('Messagerie'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<Message, DateTime>(
              padding: EdgeInsets.all(8),
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              elements: messages,
              groupBy: (message) => DateTime(
                message.date.year,
                message.date.month,
                message.date.day,
              ),
              groupHeaderBuilder: (Message message) => SizedBox(
                height: 40,
                width: 100,
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      DateFormat.yMMMd().format(message.date),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context, Message message) => Align(
                alignment: message.isSentByMe
                    ? Alignment.bottomRight
                    : Alignment.centerLeft,
                child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(message.text),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.shade200,
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    hintText: 'Tapez votre message...',
                  ),
                  onSubmitted: (text){
                    final message = Message(
                      text: text,
                      date: DateTime.now(),
                      isSentByMe: true,
                    );
                    setState(() => messages.add(message));
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: (){},
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  const Message({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}

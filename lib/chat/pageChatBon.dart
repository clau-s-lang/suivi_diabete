import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../api/apiProvider.dart';
import '../modeles/modelChatting.dart';
import '../widget/Card_comment.dart';


class MessagesBon extends StatefulWidget {
  final String patientId;

  const MessagesBon({Key? key, required this.patientId}) : super(key: key);
  @override
  _MessagesBonState createState() => _MessagesBonState();
}

class _MessagesBonState extends State<MessagesBon> {
  final _formKey = GlobalKey<FormState>();
  final commentText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    User? _currentUser = FirebaseAuth.instance.currentUser;
    String pat = widget.patientId;
    return Scaffold(
      appBar: AppBar(
        title: Text('Messagerie'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                .collection('Message').doc(pat == _currentUser!.uid ? _currentUser!.uid : pat).collection('chats')
                .snapshots(),
                builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.none) {
                    return Material(
                      child: Center(
                        child: Text('Veuillez vous connecter à internet'),
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Material(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (!snapshot.hasData) {
                    return Material(
                      child: Center(
                        child: Text('Pas de données'),
                      ),
                    );
                  }
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder:(context, index){
                      DocumentSnapshot message = snapshot.data!.docs[index];
                      bool isMe(){
                        return message['senderId'] == FirebaseAuth.instance.currentUser!.uid;
                      }
                      return Bubble(
                        alignment: isMe()?Alignment.topLeft:Alignment.bottomRight,
                        margin: isMe()?BubbleEdges.only(top: 10, left: 50):BubbleEdges.only(
                          top: 10, right: 50
                        ),
                        color: isMe()?Color(0xFF216DAD):Colors.white70,
                        nip: isMe()?BubbleNip.leftBottom:BubbleNip.rightBottom,
                        child: commentCard(
                          message: message['message'],
                          date:message['time'].toDate(),
                        ),
                      );
                      },
                  );
                },
              ),
          ),
        ],
      ),
      bottomSheet: Form(
        key: _formKey,
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: commentText,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 5, right: 5),
                      hintText: 'Ecrire un message...',
                      focusedBorder: OutlineInputBorder(
                        gapPadding: 2.0,
                        borderSide: BorderSide(color: Color(0xFF216DAD)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        gapPadding: 2.0,
                        borderSide: BorderSide(color: Color(0xFF216DAD)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: IconButton(
                    onPressed: ()async{
                      final isValid = _formKey.currentState!.validate();
                      if(!isValid){
                        return;
                      } else {
                       final message = Message(
                         message: commentText.text,
                         senderId: _currentUser!.uid,
                         time: DateTime.now(),
                       );
                        //print('${pat['id'].toString()}');
                       final provider = Provider.of<ProviderApi>(context,listen: false);
                        provider.createMessage(
                          message, pat
                        );
                        commentText.clear();
                      }
                    },
                    icon: Icon(Icons.send),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

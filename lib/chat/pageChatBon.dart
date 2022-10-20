import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../widget/Card_comment.dart';


class MessagesBon extends StatefulWidget {
  final DocumentSnapshot topic;

  const MessagesBon({Key? key, required this.topic}) : super(key: key);
  @override
  _MessagesBonState createState() => _MessagesBonState();
}

class _MessagesBonState extends State<MessagesBon> {
  final _formKey = GlobalKey<FormState>();
  final commentText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    User? _currentUser = FirebaseAuth.instance.currentUser;
    var top = widget.topic;
    return Scaffold(
      appBar: AppBar(
        title: Text('Messagerie'),
        backgroundColor: Color(0xFF216DAD),
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: top['imgUrl'] == null
                    ?Text(
                      '${top['sender']![0]}'
                    ): ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        top['imgUrl'],
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ) ,
                  title: Text('${top['sender']}',
                  style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(DateFormat('yyyy-MM-dd - kk:mm')
                      .format(top['dateTime'].toDate()).toString()),
                ),
                Divider(
                  indent: 20,
                  endIndent: 40,
                  thickness: 1.0,
                ),
                ListTile(
                  title: Text('${'message'}'),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                .collection('forum')
                .doc(top.id)
                .collection('comments')
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
                      DocumentSnapshot comment = snapshot.data!.docs[index];
                      bool isMe(){
                        return comment['uid'] == FirebaseAuth.instance.currentUser!.uid;
                      }
                      return Bubble(
                        alignment: isMe()?Alignment.topLeft:Alignment.bottomRight,
                        margin: isMe()?BubbleEdges.only(top: 10, left: 50):BubbleEdges.only(
                          top: 10, right: 50
                        ),
                        color: isMe()?Color(0xFF216DAD):Colors.white70,
                        nip: isMe()?BubbleNip.leftBottom:BubbleNip.rightBottom,
                        child: commentCard(
                          sender : comment['sender'],
                          message: comment['message'],
                          date:comment['dateTime'].toDate(),
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
                       /* final comment = Topic(
                          topic: top['topic'],
                          message: commentText.text,
                          sender:_currentUser!.displayName,
                          imgUrl:_currentUser.photoURL,
                        );*/
                        print('${top['id'].toString()}');
                       /* final provider = Provider.of<CompanionProvider>(context,listen: false);
                        provider.commment(
                          comment, top['id'].toString()
                        );*/
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

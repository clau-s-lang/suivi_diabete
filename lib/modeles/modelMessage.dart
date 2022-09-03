
import 'package:gestion_diabete/modeles/modelUser.dart';

class Message{
  final User? sender;
  final String? avatar;
  final String? time;
  final int? unreadCount;
  final bool? isRead;
  final String? text;

  Message({
     this.sender,
     this.avatar,
     this.time,
     this.unreadCount,
     this.text,
     this.isRead,
});
}

final List<Message> recentsChats = [
  Message(
      sender: Claudia,
      avatar: 'assets/images/clau.jpg',
      time: '01:25',
      unreadCount: 1,
      text: 'typing...',
      ),
  Message(
    sender: Robert,
    avatar: 'assets/images/clau.jpg',
    time: '12:46',
    unreadCount: 1,
    text: 'Serai-je dedans?',
  ),
  Message(
    sender: Melchior,
    avatar: 'assets/images/clau.jpg',
    time: '05:26',
    unreadCount: 3,
    text: 'C\'est tres genial',
  ),
  Message(
    sender: Emmanuella,
    avatar: 'assets/images/clau.jpg',
    time: '12:45',
    unreadCount: 2,
    text: 'Laisse moi voir quoi fqire',
  ),

];

final List<Message> allChats = [
  Message(
    sender: Josias,
    avatar: 'assets/images/clau.jpg',
    time: '12:59',
    unreadCount: 0,
    text: 'Non, je l\'ai juste voulu' ,
    isRead: true,
  ),
  Message(
    sender: Gabriel,
    avatar: 'assets/images/clau.jpg',
    time: '12:59',
    unreadCount: 0,
    text: 'Juste m\'inscrire pour un tutoriel' ,
    isRead: true,
  ),
  Message(
    sender: Ines,
    avatar: 'assets/images/clau.jpg',
    time: '12:59',
    unreadCount: 2,
    text: 'Puis-je vous demander quelque chose?' ,
    isRead: false,
  ),
];

final List<Message> messages = [
  Message(
      sender: Claudia,
      avatar: 'assets/images/clau.jpg',
      time: '12:09 AM',
      text: '...',
  ),
  Message(
    sender: currentUser,
    isRead: true,
    time: '12:05 AM',
    text: 'Je vais à la  maison',
  ),
  Message(
    sender: currentUser,
    isRead: true,
    time: '12:05 AM',
    text: 'J\'ai fini de travaillé',
  ),
  Message(
    sender: Claudia,
    avatar: 'assets/images/clau.jpg',
    time: '12:03 AM',
    text: 'Ou es-tu maintenant?',
  ),
  Message(
    sender: Claudia,
    avatar: 'assets/images/clau.jpg',
    time: '12:03 AM',
    text: 'As-tu fini tes taches journalieres?',
  ),
  Message(
    sender: currentUser,
    isRead: true,
    time: '12:02 AM',
    text: 'Non. je crois que ma memoire m\'a laché',
  ),
  Message(
    sender: Claudia,
    avatar: 'assets/images/clau.jpg',
    time: '12:00 AM',
    text: 'Es-tu sur de n\'avoir rien à me dire?',
  ),
  Message(
    sender: currentUser,
    isRead: true,
    time: '11:55 AM',
    text: 'De quel rapport parlez vous?',
  ),
  Message(
    sender: Claudia,
    avatar: 'assets/images/clau.jpg',
    time: '11:53 AM',
    text: 'Il est ou mon rapport?',
  ),
  Message(
    sender: currentUser,
    isRead: true,
    time: '11:51 AM',
    text: 'Non. je crois que ma memoire m\'a laché',
  ),
  Message(
    sender: Claudia,
    avatar: 'assets/images/clau.jpg',
    time: '11:50 AM',
    text: 'Es-tu sur de n\'avoir rien à me dire?',
  ),
];
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../constants/data_constant.dart';
import '../riverpod_practice/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'chat_page.dart';

class AdminChatPage extends StatefulWidget {
  const AdminChatPage({
    super.key,
  });

  @override
  State<AdminChatPage> createState() => _AdminChatPageState();
}

class _AdminChatPageState extends State<AdminChatPage> {
  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();

  Stream<QuerySnapshot> getMessage(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join('_');

    return FirebaseFirestore.instance
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: _buildUsersList(),
    );
  }

  Widget _buildUsersList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('error ${snapshot.error}');
        } else if (snapshot.hasData) {
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildUserListItem(doc))
                .toList(),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    if (FirebaseAuth.instance.currentUser!.email != data['Email']) {
      return ListTile(
        title: Text(
          data['Email'],
        ),
        onTap: () {
          Navigator.of(context).push(
            PageTransition(
              child: ChatPage(
                recieverEmail: data['Email'],
                recieverUserID: data['Uid'],
              ),
              type: PageTransitionType.rightToLeft,
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}

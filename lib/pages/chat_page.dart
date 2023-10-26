import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:sliverapp_practice/model/date_format.dart';

import '../constants/data_constant.dart';
import '../riverpod_practice/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../riverpod_practice/notification_service.dart';
import '../widgets/delete_message_button.dart';

class ChatPage extends StatefulWidget {
  final String recieverEmail;
  final String recieverUserID;
  const ChatPage({
    super.key,
    required this.recieverEmail,
    required this.recieverUserID,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  String _fcmToken = '';

  final ChatService _chatService = ChatService();
  final NotificationService _notificationService = NotificationService();

  Future<void> getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();

    setState(() {
      _fcmToken = token!;
      print('token for user ${_fcmToken}');
    });
  }

  Future<void> sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
        widget.recieverUserID,
        _messageController.text,
        FirebaseAuth.instance.currentUser!.uid,
      );
      await _notificationService.sendNotification(
        body: _messageController.text,
        senderId: FirebaseAuth.instance.currentUser!.uid,
      );

      // await _chatService.sendNotificationToUser(
      //   'dGKDO_-RQJ-9IM3dDL4tqf:APA91bFBYA1P_ok8LF4v1dvoTWdjqNwGzarM1g1tduMzCWliV4uHaZ2_KP_BOFxvUfpZzUjNA1NP7nmTIt7SKxCeKDbzJyNKlp9U4dOP31dkXXv0uyVD_g6vaZy2gbPFq4a8jf_OtqtS',
      //   _messageController.text,
      // );
    }

    _messageController.clear();
  }

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

  void deleteMessage(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join('_');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Message'),
        content: Text('Are you sure you want to delete message'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('cancel'),
          ),
          TextButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('chat_rooms')
                  .doc(chatRoomId)
                  .collection('messages')
                  .doc()
                  .delete();
            },
            child: Text('delete'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _notificationService.getReceiverToken(widget.recieverUserID);
    _notificationService.firebaseNotification(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Cza Support',
          style: TextStyle(
            color: Colors.deepOrange,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.tertiary,
        elevation: 0,
      ),
      body: Column(children: [
        // ListView(
        //   reverse: true,
        //   children: [],
        // ),
        Expanded(
          child: _buildMessageList(),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  bottom: 20,
                  top: 20,
                ),
                child: TextFormField(
                  // minLines: 2,
                  maxLines: null,
                  // maxLength: 6,
                  textInputAction: TextInputAction.newline,

                  autofocus: true,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
                  ),
                  controller: _messageController,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Enter Message',
                    hintStyle: TextStyle(
                        color: blackColor, fontSize: screenSize.width * 0.03),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.tertiary,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // focusedBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              // padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(10),
              child: IconButton(
                onPressed: sendMessage,
                icon: Icon(Icons.arrow_upward),
              ),
            ),
          ],
        )
      ]),
    );
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var messageAlignment =
        (data['senderId'] == FirebaseAuth.instance.currentUser!.uid)
            ? Alignment.centerRight
            : Alignment.centerLeft;

    return Container(
      alignment: messageAlignment,
      child: Column(
          crossAxisAlignment:
              data['senderId'] == FirebaseAuth.instance.currentUser!.uid
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          mainAxisAlignment:
              data['senderId'] == FirebaseAuth.instance.currentUser!.uid
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10),
              child: Container(child: Text(data['senderEmail'])),
            ),
            Row(
              crossAxisAlignment:
                  data['senderId'] == FirebaseAuth.instance.currentUser!.uid
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
              mainAxisAlignment:
                  data['senderId'] == FirebaseAuth.instance.currentUser!.uid
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.pink,
                    alignment: messageAlignment,
                    child: Text(formateTime(data['timestamp'])),
                    padding: EdgeInsets.all(12),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(5),
                    //   // color: Theme.of(context).colorScheme.tertiary,
                    //   // color: data['senderId'] ==
                    //   //         FirebaseAuth.instance.currentUser!.uid
                    //   //     ? Colors.deepOrange
                    //   //     : Colors.amber,
                    // ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blue,
                    child: Text(formateDate(data['timestamp'])),
                    padding: EdgeInsets.all(12),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                top: 5,
                // bottom: 5,
                right: 10,
              ),
              child: Row(
                crossAxisAlignment:
                    data['senderId'] == FirebaseAuth.instance.currentUser!.uid
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                mainAxisAlignment:
                    data['senderId'] == FirebaseAuth.instance.currentUser!.uid
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                children: [
                  // Builder(builder: (context) {
                  //   final screenSize = MediaQuery.sizeOf(context);
                  //   return SizedBox(
                  //     width: screenSize.width * 0.1,
                  //   );
                  // }),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Builder(builder: (context) {
                        final screenSize = MediaQuery.sizeOf(context);
                        return Container(
                          // margin:
                          //     EdgeInsets.only(top: 10, bottom: 10, left: 80),
                          child: ClipPath(
                            clipper: UpperNipMessageClipperTwo(
                                data['senderId'] ==
                                        FirebaseAuth.instance.currentUser!.uid
                                    ? MessageType.send
                                    : MessageType.receive),
                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: 10,
                              ),
                              // constraints: BoxConstraints(
                              //   maxWidth: screenSize.width * 0.5,
                              //   // minWidth: screenSize.width * 0.2,
                              // ),
                              alignment: messageAlignment,
                              child: Text(
                                data['message'],
                                textAlign: TextAlign.start,
                              ),
                              padding: EdgeInsets.only(
                                  left: 25, right: 25, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: data['senderId'] ==
                                        FirebaseAuth.instance.currentUser!.uid
                                    ? Colors.deepOrange.withOpacity(0.3)
                                    : Colors.amber.withOpacity(0.3),
                              ),
                            ),
                          ),
                        );
                      }),
                      // if (data['senderEmail'] ==
                      //     FirebaseAuth.instance.currentUser!.email)
                      //   DeleteMessageButton(
                      //     onTap: () {
                      //       deleteMessage(
                      //         widget.recieverEmail,
                      //         widget.recieverUserID,
                      //       );
                      //     },
                      //   ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessage(
          widget.recieverUserID, FirebaseAuth.instance.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('error ${snapshot.error}');
        } else if (snapshot.hasData) {
          return ListView(
            controller: _chatService.scrollController,
            children: snapshot.data!.docs
                .map((document) => _buildMessageItem(document))
                .toList(),
          );
        } else {
          return Center(
            child: Container(
              height: 10,
              width: 10,
              child: CircularProgressIndicator(
                backgroundColor: Colors.deepOrange,
                color: Colors.black,
              ),
            ),
          );
        }
      },
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sliverapp_practice/main.dart';
import 'package:sliverapp_practice/riverpod_practice/notification_service.dart';

import '../model/message.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ChatService extends ChangeNotifier {
  // function to initialize notification
  Future<void> requestPermission() async {
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accpeted permission');
    }

    final FcmToken = await _firebaseMessaging.getToken();

    print('Token ${FcmToken}');
    initPushNotification();
  }

  // function to handle receuved messages
  void handleMessage(RemoteMessage? message) {
    // if message is null  do nothing
    if (message == null) return;

    // navigate to new screen  when mesage is receievd and user taps notification
    navigatorKey.currentState?.pushNamed(
      '/notification_screen',
      arguments: message,
    );
  }

  // funtion to initialize background settings
  Future initPushNotification() async {
    // handle notification if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

// attach event listeners for when a notification opens the app

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }

  Future<void> getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print(token);

    // setState(() {
    //   _fcmToken = token;
    // });
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance.collection("User Token").doc('User1').set({
      'token': token,
    });
  }

  Future sendNotificationToUser(String userFcmTOken, String messaage) async {
    FirebaseMessaging _firebaseMesaaging = FirebaseMessaging.instance;
    // dGKDO_-RQJ-9IM3dDL4tqf:APA91bFBYA1P_ok8LF4v1dvoTWdjqNwGzarM1g1tduMzCWliV4uHaZ2_KP_BOFxvUfpZzUjNA1NP7nmTIt7SKxCeKDbzJyNKlp9U4dOP31dkXXv0uyVD_g6vaZy2gbPFq4a8jf_OtqtS
    await _firebaseMesaaging.sendMessage(
      to: userFcmTOken,
      data: {
        'title': 'new message',
        'body': messaage,
      },
    );
  }

  ScrollController scrollController = ScrollController();

  // function to send message
  Future<void> sendMessage(
    String receiverId,
    String message,
    String currentUserId,
  ) async {
    // get current user details

    final String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final String currentUserEmail =
        FirebaseAuth.instance.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();
    List<String> ids = [currentUserId, receiverId];
    ids.sort();

    String chatRoomId = ids.join('_');
    final id = FirebaseFirestore.instance
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .doc()
        .id;

    // create new messaege
    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
      id: id,
    );

    // List<String> ids = [currentUserId, receiverId];
    // ids.sort();

    // String chatRoomId = ids.join('_');

    // add message to database
    await FirebaseFirestore.instance
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toJson());
    // await NotificationService()
    //     .sendNotification(body: body, senderId: senderId);
    scrollDown();

    Future.delayed(Duration(seconds: 2), () {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  // function to get message from database

  Stream<QuerySnapshot> getMessage(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join('_');
    scrollDown();

    return FirebaseFirestore.instance
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  scrollDown() {
    return WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }

  // void deleteMessage(String userId, String otherUserId) {
  //   List<String> ids = [userId, otherUserId];
  //   ids.sort();
  //   String chatRoomId = ids.join('_');

  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text('Delete Message'),
  //       content: Text('Are you sure you want to delete message'),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: Text('cancel'),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             FirebaseFirestore.instance
  //                 .collection('chat_rooms')
  //                 .doc(chatRoomId)
  //                 .collection('messages')
  //                 .doc(widget.recieverEmail)
  //                 .delete();
  //           },
  //           child: Text('delete'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

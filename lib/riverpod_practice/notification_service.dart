import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

import '../pages/chart_screen.dart';
import '../pages/chat_page.dart';

class NotificationService {
  static const key =
      'AAAASXtbO1M:APA91bFjfAzh1lnLWOUadU_koR9tjMzT2DmuqfgLimMj5ayFGFKbx0Y6eNh5Vs-E6FrFFaCl5ctJ0R2O8Bd6T5cp0tG013sUAjsyDZXR3g-qzqSOFPVxZ-RQbUkR3FqPFgIDv8adJjp2';

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void _initLocalNotification() {
    const andriodSettings =
        AndroidInitializationSettings('@mipmap/launcher_icon');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestProvisionalPermission: false,
      requestCriticalPermission: true,
    );

    const initializationSettings =
        InitializationSettings(android: andriodSettings, iOS: iosSettings);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (response) {
        debugPrint(response.payload.toString());
      },
    );
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    final styleInformation = BigTextStyleInformation(
      message.notification!.body.toString(),
      htmlFormatBigText: true,
      contentTitle: message.notification!.title,
      htmlFormatTitle: true,
    );

    final andriodDetails = AndroidNotificationDetails(
      'com.example.sliverapp_practice',
      'mychannelid',
      importance: Importance.max,
      styleInformation: styleInformation,
      priority: Priority.max,
    );

    const iosDetails =
        DarwinNotificationDetails(presentAlert: true, presentBadge: true);
    final notificationDetails = NotificationDetails(
      android: andriodDetails,
      iOS: iosDetails,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification!.title,
      message.notification!.body,
      notificationDetails,
      payload: message.data['body'],
    );
  }

  Future<void> requestPermission() async {
    final messaging = FirebaseMessaging.instance;
    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('User granted provisional permission');
    } else {
      debugPrint('User declined or has not accepted permission');
    }
  }

  Future<void> getToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    _savetoken(token!);
  }

  String receiverToken = '';

  Future<void> _savetoken(String token) async =>
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(
        {'token': token},
        SetOptions(
          merge: true,
        ),
      );
  Future<void> getReceiverToken(String? receiverId) async {
    final getToken = await FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .get();

    receiverToken = await getToken.data()!['token'];
  }

  void firebaseNotification(context) {
    _initLocalNotification();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChatPage(
          recieverEmail: message.data['Email'],
          recieverUserID: message.data['Uid'],
        ),
      ));
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await _showLocalNotification(message);
    });
  }

  Future<void> sendNotification(
      {required String body, required String senderId}) async {
    try {
      await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization': 'key=$key'
          },
          body: jsonEncode(<String, dynamic>{
            'to': receiverToken,
            'priority': 'high',
            'notification': <String, dynamic>{
              'body': body,
              'title': 'New Message',
            },
            'data': <String, String>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'senderId': senderId,
            }
          }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

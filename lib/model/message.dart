import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;

  final String senderEmail;

  final String receiverId;

  final String message;
  final String id;

  final Timestamp timestamp;

  Message({
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.message,
    required this.timestamp,
    required this.id,
  });

  // convert object to JSON fornat or map

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
      'id': id,
    };
  }
}

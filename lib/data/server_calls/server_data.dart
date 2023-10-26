import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  User? user = FirebaseAuth.instance.currentUser;
  Future getFirstName() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uid)
        .get();
  }
}

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';



// class SupabaseReadDisplay extends StatelessWidget {
//   const SupabaseReadDisplay({super.key});

//   @override
//   Widget build(BuildContext context) {
//        final userDoc = FirebaseFirestore.instance.collection('users').doc(userId);
//     return Scaffold(
//  body: FutureBuilder<DocumentSnapshot>(
//         future: userDoc.get(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }else if
//  (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           final firstName = snapshot.data?.get('firstName') as String?;

//           return Padding(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('First Name: $firstName'),
//                 // Other user info here...
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



// // class UserScreen extends StatelessWidget {
// //   final String userId;

// //   UserScreen({required this.userId});

// //   @override
// //   Widget build(BuildContext context) {
 

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('User Profile'),
// //       ),
     
// //     );
// //   }
// // }
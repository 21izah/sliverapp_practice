// ignore_for_file: unused_import, avoid_function_literals_in_foreach_calls, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:sliverapp_practice/backend_page_operations/get_user_name.dart';
import 'package:sliverapp_practice/containers/coinBuySell.dart';
import 'package:sliverapp_practice/containers/neuCoinContainer.dart';
import 'package:sliverapp_practice/pages/customer_care_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/data_constant.dart';
import '../containers/card_details.dart';
import 'sign_in_homepage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double coverHeight = 300;
  final double profileHeight = 144;
  // final user = FirebaseAuth.instance.currentUser!;
  final docUsers = FirebaseFirestore.instance.collection('users').doc();
  final _username = Hive.box('username');
  String firstName = '';
  String otherName = '';
  String surname = '';
  String phoneNumber = '';
  String email = '';
  String userName = '';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: screenSize.height * 0.2,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        // bottomRight: Radius.circular(70),
                        ),
                  ),
                ),
                Container(
                  height: screenSize.height * 0.8,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Text(
                              'FirstName',
                              style: TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: screenSize.width - 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor),
                            margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            padding: EdgeInsets.all(20),
                            child: FutureBuilder<DocumentSnapshot>(
                              future: FirebaseFirestore.instance
                                  .collection('Users')
                                  .doc(user!.email)
                                  .get(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  Map<String, dynamic> data = snapshot.data!
                                      .data() as Map<String, dynamic>;
                                  return Text(
                                    '${data['First Name']}',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: whiteColor,
                                    ),
                                  );
                                } else {
                                  return Text('loading');
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Surname',
                              style: TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: screenSize.width - 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor),
                            margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            padding: EdgeInsets.all(20),
                            child: FutureBuilder<DocumentSnapshot>(
                              future: FirebaseFirestore.instance
                                  .collection('Users')
                                  .doc(user.email)
                                  .get(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  Map<String, dynamic> data = snapshot.data!
                                      .data() as Map<String, dynamic>;
                                  return Text(
                                    ' ${data['Surname']}',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: whiteColor,
                                    ),
                                  );
                                } else {
                                  return Text('loading');
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Username',
                              style: TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: screenSize.width - 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor),
                            margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            padding: EdgeInsets.all(20),
                            child: FutureBuilder<DocumentSnapshot>(
                              future: FirebaseFirestore.instance
                                  .collection('Users')
                                  .doc(user.email)
                                  .get(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  Map<String, dynamic> data = snapshot.data!
                                      .data() as Map<String, dynamic>;
                                  return Text(
                                    '${data['Surname']}',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: whiteColor,
                                    ),
                                  );
                                } else {
                                  return Text('loading');
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Phone Number',
                              style: TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: screenSize.width - 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor),
                            margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            padding: EdgeInsets.all(20),
                            child: FutureBuilder<DocumentSnapshot>(
                              future: FirebaseFirestore.instance
                                  .collection('Users')
                                  .doc(user.email)
                                  .get(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  Map<String, dynamic> data = snapshot.data!
                                      .data() as Map<String, dynamic>;
                                  return Text(
                                    ' ${data['Phone Number']}',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: whiteColor,
                                    ),
                                  );
                                } else {
                                  return Text('loading');
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget buildTop() {
  //   final double topHeight = coverHeight - (profileHeight / 2);

  //   return Stack(
  //     clipBehavior: Clip.none,
  //     alignment: Alignment.center,
  //     children: [
  //       buildCoverImage(),
  //       Positioned(top: topHeight, child: buildProfileImage()),
  //     ],
  //   );
  // }

  // Widget buildCoverImage() => Container(
  //       color: Colors.black,
  //       width: double.infinity,
  //       height: coverHeight,
  //       child: Image.asset(
  //         'lib/assets/Cza.jpg',
  //         fit: BoxFit.cover,
  //       ),
  //     );

  // Widget buildProfileImage() => CircleAvatar(
  //       backgroundColor: Colors.grey[900],
  //       radius: 80,
  //       child: CircleAvatar(
  //         backgroundColor: Colors.black,
  //         radius: profileHeight / 2,
  //         child: const Icon(Icons.person, size: 70, color: Colors.deepOrange),
  //       ),
  //     );
}

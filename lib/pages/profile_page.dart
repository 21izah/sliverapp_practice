// ignore_for_file: unused_import, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:sliverapp_practice/backend_page_operations/get_user_name.dart';
import 'package:sliverapp_practice/containers/coinBuySell.dart';
import 'package:sliverapp_practice/containers/neuCoinContainer.dart';
import 'package:sliverapp_practice/pages/customer_care_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double coverHeight = 300;
  final double profileHeight = 144;
  final user = FirebaseAuth.instance.currentUser!;

  // method for getting document IDs
  // Future getDocIds() async {
  //   await FirebaseFirestore.instance.collection('users');
  // }
  // takes you to the start collection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade900,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  child: Icon(Icons.person, color: Colors.black),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Welcome Back',
                        style: TextStyle(color: Colors.white)),
                    Text(' Investor  ${user.email!}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          NeuCoinCardContainer(
            coinName: 'BUSD',
            coinImage: Image.asset('lib/assets/busd-unscreen.gif'),
          ),
        ],

        //  Padding(
        //   padding:
        //   EdgeInsets.fromLTRB(10, 0, 10, 0),
        //   child:
        //     ListView(
        //   children: [
        //     buildTop(),
        //     const SizedBox(
        //       height: 100,
        //     ),
        //     Container(
        //       margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        //       height: 750,
        //       decoration: BoxDecoration(boxShadow: const [
        //         BoxShadow(
        //           color: Colors.deepOrange,
        //           blurRadius: 15,
        //           offset: Offset(5, 5),
        //           spreadRadius: 2,
        //         ),
        //         BoxShadow(
        //           color: Colors.deepOrange,
        //           blurRadius: 15,
        //           offset: Offset(-5, -5),
        //           spreadRadius: 2,
        //         ),
        //       ], color: Colors.black, borderRadius: BorderRadius.circular(20)),
        //       // color: Colors.blue,
        //       child: Column(children: [
        //         Container(
        //           margin: const EdgeInsets.fromLTRB(10, 40, 10, 40),
        //           padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
        //           decoration: BoxDecoration(
        //               boxShadow: const [
        //                 BoxShadow(
        //                   color: Colors.deepOrange,
        //                   blurRadius: 15,
        //                   offset: Offset(5, 5),
        //                   spreadRadius: 2,
        //                 ),
        //                 BoxShadow(
        //                   color: Colors.deepOrange,
        //                   blurRadius: 15,
        //                   offset: Offset(-5, -5),
        //                   spreadRadius: 2,
        //                 ),
        //               ],
        //               color: Colors.black,
        //               borderRadius: BorderRadius.circular(20)),
        //           height: 150,
        //           // color: Colors.pink,
        //           child: Column(
        //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //               children: const [
        //                 Text('NAME',
        //                     style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 20,
        //                         fontWeight: FontWeight.bold)),
        //                 SizedBox(
        //                   height: 10,
        //                 ),
        //                 Text('FIRST NAME: MICHAEL',
        //                     style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 13,
        //                         fontWeight: FontWeight.bold)),
        //                 Text('SURNAME: IZAH  ',
        //                     style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 13,
        //                         fontWeight: FontWeight.bold)),
        //                 Text('OTHER NAMES:',
        //                     style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 13,
        //                         fontWeight: FontWeight.bold)),
        //               ]),
        //         ),
        //         Container(
        //           margin: const EdgeInsets.fromLTRB(10, 40, 10, 40),
        //           padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
        //           decoration: BoxDecoration(
        //               boxShadow: const [
        //                 BoxShadow(
        //                   color: Colors.deepOrange,
        //                   blurRadius: 15,
        //                   offset: Offset(5, 5),
        //                   spreadRadius: 2,
        //                 ),
        //                 BoxShadow(
        //                   color: Colors.deepOrange,
        //                   blurRadius: 15,
        //                   offset: Offset(-5, -5),
        //                   spreadRadius: 2,
        //                 ),
        //               ],
        //               color: Colors.black,
        //               borderRadius: BorderRadius.circular(20)),
        //           height: 150,
        //           // color: Colors.pink,
        //           child: Column(
        //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //               children: const [
        //                 Text('PHONE NUMBER',
        //                     style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 20,
        //                         fontWeight: FontWeight.bold)),
        //                 SizedBox(
        //                   height: 10,
        //                 ),
        //                 Text('09064139951',
        //                     style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 13,
        //                         fontWeight: FontWeight.bold)),
        //               ]),
        //         ),
        //         Container(
        //           margin: const EdgeInsets.fromLTRB(10, 40, 10, 40),
        //           padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
        //           decoration: BoxDecoration(
        //               boxShadow: const [
        //                 BoxShadow(
        //                   color: Colors.deepOrange,
        //                   blurRadius: 15,
        //                   offset: Offset(5, 5),
        //                   spreadRadius: 2,
        //                 ),
        //                 BoxShadow(
        //                   color: Colors.deepOrange,
        //                   blurRadius: 15,
        //                   offset: Offset(-5, -5),
        //                   spreadRadius: 2,
        //                 ),
        //               ],
        //               color: Colors.black,
        //               borderRadius: BorderRadius.circular(20)),
        //           height: 150,
        //           // color: Colors.pink,
        //           child: Column(
        //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //               children: const [
        //                 Text('EMAIL',
        //                     style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 20,
        //                         fontWeight: FontWeight.bold)),
        //                 SizedBox(
        //                   height: 10,
        //                 ),
        //                 Text('21MICHAEL@GMAIL.COM',
        //                     style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 13,
        //                         fontWeight: FontWeight.bold)),
        //               ]),
        //         ),
        //       ]),
        //     ),
        //     const SizedBox(
        //       height: 50,
        //     ),
        //     GestureDetector(
        //         onTap: () => showModalBottomSheet(
        //             backgroundColor: Colors.grey[900],
        //             shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(20)),
        //             context: context,
        //             builder: (context) => buildSheet()),
        //         child: Container(
        //             margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        //             padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
        //             decoration: BoxDecoration(
        //                 boxShadow: const [
        //                   BoxShadow(
        //                     color: Colors.deepOrange,
        //                     blurRadius: 15,
        //                     offset: Offset(5, 5),
        //                     spreadRadius: 2,
        //                   ),
        //                   BoxShadow(
        //                     color: Colors.deepOrange,
        //                     blurRadius: 15,
        //                     offset: Offset(-10, -10),
        //                     spreadRadius: 2,
        //                   ),
        //                 ],
        //                 color: Colors.black,
        //                 borderRadius: BorderRadius.circular(20)),
        //             child: const Center(
        //               child: Text(
        //                 'DASHBOARD',
        //                 style: TextStyle(color: Colors.deepOrange, fontSize: 20),
        //               ),
        //             ))),
        //     const SizedBox(
        //       height: 50,
        //     ),
        //   ],
        // ),
        // ),
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

  // Widget buildSheet() => DraggableScrollableSheet(
  //       initialChildSize: 0.9,
  //       //  minChildSize: 0.5,
  //       maxChildSize: 0.9,
  //       builder: (_, controller) => Container(
  //         color: Colors.grey[900],
  //         child: ListView(
  //           controller: controller,
  //           children: [
  //             const CircleAvatar(
  //               backgroundColor: Colors.deepOrange,
  //               radius: 80,
  //               child: CircleAvatar(
  //                 backgroundColor: Colors.black,
  //                 radius: 70,
  //                 child: Icon(Icons.person, size: 70, color: Colors.deepOrange),
  //               ),
  //             ),
  //             Container(
  //               margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
  //               child: Column(
  //                 children: [
  //                   const Text(
  //                     'HELLO INVESTOR ',
  //                     style: TextStyle(
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.deepOrange),
  //                   ),
  //                   const SizedBox(
  //                     height: 40,
  //                   ),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: const [
  //                       Text(
  //                         'CURRENT BALANCE:',
  //                         style: TextStyle(
  //                             fontSize: 20,
  //                             fontWeight: FontWeight.bold,
  //                             color: Colors.deepOrange),
  //                       ),
  //                       SizedBox(
  //                         width: 10,
  //                       ),
  //                       Text(
  //                         '\$400',
  //                         style: TextStyle(
  //                             fontSize: 20,
  //                             fontWeight: FontWeight.bold,
  //                             color: Colors.deepOrange),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             GestureDetector(
  //               // onTap: () => ,
  //               child: Container(
  //                 margin: const EdgeInsets.fromLTRB(70, 50, 70, 50),
  //                 padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
  //                 decoration: BoxDecoration(
  //                     boxShadow: const [
  //                       BoxShadow(
  //                         color: Colors.deepOrange,
  //                         blurRadius: 15,
  //                         offset: Offset(5, 5),
  //                         spreadRadius: 2,
  //                       ),
  //                       BoxShadow(
  //                         color: Colors.deepOrange,
  //                         blurRadius: 15,
  //                         offset: Offset(-10, -10),
  //                         spreadRadius: 2,
  //                       ),
  //                     ],
  //                     color: Colors.black,
  //                     borderRadius: BorderRadius.circular(20)),
  //                 child: const Center(
  //                   child: Text(
  //                     'WITHDRAW',
  //                     style: TextStyle(
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.deepOrange),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
}

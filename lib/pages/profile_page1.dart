import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sliverapp_practice/pages/customer_care_page.dart';
import 'package:sliverapp_practice/pages/profile_page.dart';

import '../constants/data_constant.dart';
import '../containers/darkmode_lightmode.dart';
import '../containers/option_selection.dart';
import '../riverpod_practice/change_light_dark_mode_provider.dart';
import '../riverpod_practice/logout_button_text.dart';

import '../riverpod_practice/theme_provider.dart';
import '../widgets/drop_down_button2.dart';
import 'security_page.dart';
import 'terms_and_condition.dart';
import 'package:shared_preferences/shared_preferences.dart';

final bucketGlobsl = PageStorageBucket();

class ProfilePage1 extends StatefulWidget {
  ProfilePage1({super.key});

  @override
  State<ProfilePage1> createState() => _ProfilePage1State();
}

class _ProfilePage1State extends State<ProfilePage1> {
  // late ChangeLightDarkMode appState;
//   final _mybox = Hive.box('isDarkModeOn');

//   @override
//   void initState()  {
//     // final prefs = await SharedPreferences.getInstance();
//     // prefs.getBool('key');

//     // print(prefs.getBool('key'));
//     // Hive.openBox('isDarkModeOn');
//     // _mybox.get('isDarkModeOn');
// //     if (_mybox.get('isDarkModeOn') == null) {
// //       // deflaut toggle posiion
// //       // toggleColorScheme(to);
// //     } else {
// // // load stored postion
// //       // loadSavedState();
// //     }

//     // update the new toggle position
//     super.initState();
//     // appState = Provider.of<ChangeLightDarkMode>(context, listen: false);
//     // appState.loadSavedState();
//   }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   appState.saveState();
  //   super.dispose();
  // }

  bool islightmodeEnabled = true;

  void toggleColorScheme(bool value) {
    setState(() {
      islightmodeEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    User? user = FirebaseAuth.instance.currentUser;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageTransition(
                  child: ProfilePage(),
                  type: PageTransitionType.rightToLeft,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      child: Icon(
                        Icons.person_4_rounded,
                        color: Colors.white,
                      ),
                      radius: 25,
                      backgroundColor: primaryColor,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Investor',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FutureBuilder<DocumentSnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('Users')
                            .doc(user!.email)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Text(
                              '${data['First Name']}',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            );
                          } else {
                            return Text('loading');
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Manage Account',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20,
                  bottom: 5,
                  top: 5,
                ),
                child: DropDownButton2(),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageTransition(
                  child: SecurityPage(),
                  type: PageTransitionType.rightToLeft,
                ),
              );
            },
            child: OptionSelection(
              textHeaderColor: Colors.black,
              iconImage: Icon(
                Icons.security_rounded,
                color: Colors.amber[700],
              ),
              TextHeader: 'Secuity',
            ),
          ),
          Consumer<ChangeLightDarkMode>(
            builder: (context, su, _) => PageStorage(
              bucket: bucketGlobsl,
              child: LightModeSwitch(
                textHeaderColor: Colors.black,
                iconImage: Icon(
                  Icons.color_lens_outlined,
                  color: Colors.amber[700],
                ),
                TextHeader: su.isDarkmodeEnabled ? 'Dark Mode' : 'Light Mode',
              ),
            ),
          ),
          // Consumer<ThemeProvider>(
          //   builder: (context, su, _) => LightModeSwitch(
          //     textHeaderColor: Colors.black,
          //     iconImage: Icon(
          //       Icons.color_lens_outlined,
          //       color: Colors.amber[700],
          //     ),
          //     TextHeader: su.isDarkmodeEnabled ? 'Dark Mode' : 'Light Mode',
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageTransition(
                  child: TermsAndCondition(),
                  type: PageTransitionType.rightToLeft,
                ),
              );
            },
            child: OptionSelection(
              textHeaderColor: Colors.black,
              iconImage: Icon(
                Icons.collections_bookmark_rounded,
                color: Colors.amber[700],
              ),
              TextHeader: 'Terms of Service',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageTransition(
                  child: CustomerCarePage(),
                  type: PageTransitionType.rightToLeft,
                ),
              );
            },
            child: OptionSelection(
              textHeaderColor: Colors.black,
              iconImage: Icon(
                Icons.messenger,
                color: Colors.amber[700],
              ),
              TextHeader: 'Customer Support',
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: OptionSelection(
              textHeaderColor: Colors.black,
              iconImage: Icon(
                Icons.share_rounded,
                color: Colors.amber[700],
              ),
              TextHeader: 'Share App',
            ),
          ),
          Consumer<LogOutButton>(
            builder: (context, log, child) => GestureDetector(
              onTap: () => log.isLoading ? null : log.simulateLogOut(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: log.isLoading ? Colors.grey : Colors.redAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: screenSize.height * 0.05,
                        width: screenSize.width - 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            log.isLoading
                                ? Center(
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation(whiteColor),
                                        backgroundColor: Colors.black,
                                        strokeWidth: 5,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : Icon(
                                    Icons.logout_rounded,
                                    color: Colors.white,
                                  ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                log.isLoading ? 'Please wait' : 'SIGN OUT',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),

                        // log.isLoading
                        //     ? Center(
                        //         child: Container(
                        //           height: 10,
                        //           width: 10,
                        //           child: CircularProgressIndicator(
                        //             valueColor:
                        //                 AlwaysStoppedAnimation(whiteColor),
                        //             backgroundColor: Colors.black,
                        //             strokeWidth: 5,
                        //             color: Colors.black,
                        //           ),
                        //         ),
                        //       )
                        //     : Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Icon(
                        //             Icons.logout_rounded,
                        //             color: Colors.white,
                        //           ),
                        //           Text(
                        //             'Logout',
                        //             style: TextStyle(
                        //               color: Colors.white,
                        //               fontSize: 12,
                        //               fontWeight: FontWeight.bold,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ].animate().slideY(duration: 500.ms),
      ),
    );
  }
}

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../constants/data_constant.dart';
import '../pages/chat_page.dart';

class SupportContainer extends StatelessWidget {
  const SupportContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('Users')
          .doc('F3nkSVLD3gO9akXuZYZTSPUCs2m1')
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
              top: 10,
              bottom: 10,
            ),
            child: GestureDetector(
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
              child: Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primaryColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    speed: const Duration(milliseconds: 50),
                                    'Live Chat Representative',
                                    textStyle: TextStyle(
                                        fontSize: screenSize.height * 0.02,
                                        fontWeight: FontWeight.bold,
                                        color: whiteColor),
                                  ),
                                ],
                              ),
                              AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    speed: const Duration(milliseconds: 50),
                                    'We are always online to help you out',
                                    textStyle: TextStyle(
                                        fontSize: screenSize.height * 0.01,
                                        fontWeight: FontWeight.bold,
                                        color: whiteColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: screenSize.height * 0.02,
                            backgroundColor: Colors.orange,
                            child: Icon(
                              Icons.messenger,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: primaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                speed: const Duration(milliseconds: 50),
                                'Live Chat Representative',
                                textStyle: TextStyle(
                                    fontSize: screenSize.height * 0.02,
                                    fontWeight: FontWeight.bold,
                                    color: whiteColor),
                              ),
                            ],
                          ),
                          AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                speed: const Duration(milliseconds: 50),
                                'We are always online to help you out',
                                textStyle: TextStyle(
                                    fontSize: screenSize.height * 0.01,
                                    fontWeight: FontWeight.bold,
                                    color: whiteColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: screenSize.height * 0.02,
                        backgroundColor: Colors.orange,
                        child: Icon(
                          Icons.messenger,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

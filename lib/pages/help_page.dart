// ignore_for_file: unused_field, deprecated_member_use, avoid_unnecessary_containers

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/data_constant.dart';
import 'customer_care_page.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  // void launchWhatsapp({@required number, @required message}) async {
  //   String url = "whatsapp://send?phone=$number&text=$message";

  //   await canLaunch(url) ? launch(url) : print('cannot open whatsapp');
  // }

  final String _whatsappHelp = "https://wa.me/message/HYPZLULQV6N3E1";
  final String _telegramHelp = "https://t.me/Michael_izah";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // appBar: AppBar(
      //   backgroundColor: Colors.deepOrange,
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       'Support',
          //       style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.deepOrange),
          //     ),
          //   ],
          // ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('lib/assets/24hrs_customer_care_and_transaction.png'),

            // Text(
            //   'Always here to support you',
            //   style: TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.white,
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),

            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 100.0,
                    right: 100,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunch(
                                "https://www.instagram.com/cza_exchange/")) {
                              await launch(
                                "https://www.instagram.com/cza_exchange/",
                                forceSafariVC: false,
                                forceWebView: false,
                                enableJavaScript: true,
                              );
                            }
                          },
                          child: CircleAvatar(
                            child: Lottie.asset(
                                'lib/assets/instagram-logo-effect.json'),
                            radius: 15,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunch(
                                "http://tiktok.com/@cza_xchange")) {
                              await launch(
                                "http://tiktok.com/@cza_xchange",
                                forceSafariVC: false,
                                forceWebView: false,
                                enableJavaScript: true,
                              );
                            }
                          },
                          child: CircleAvatar(
                            child: Lottie.asset('lib/assets/tiktok-icon.json'),
                            radius: 15,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            child: Lottie.asset(
                                'lib/assets/facebook-logo-effect.json'),
                            radius: 15,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunch(
                                "https://wa.me/message/HYPZLULQV6N3E1")) {
                              await launch(
                                "https://wa.me/message/HYPZLULQV6N3E1",
                                forceSafariVC: false,
                                forceWebView: false,
                                enableJavaScript: true,
                              );
                            }
                          },
                          child: CircleAvatar(
                            child: Lottie.asset(
                                'lib/assets/whatsapp-button-call-attention-and-pause.json'),
                            radius: 15,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ]),
                ),
                Text(
                  'Follow us on Socials',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                      fontSize: 20),
                ),
              ]),
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: primaryColor),
            ),

            const SizedBox(
              height: 10,
            ),

            Padding(
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
                      child: CustomerCarePage(),
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
                                      'Live Chat Support',
                                      textStyle: TextStyle(
                                          fontSize: 20,
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
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: whiteColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            CircleAvatar(
                              radius: 20,
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
            ),
            // GestureDetector(
            //   onTap: () async {
            //     if (await canLaunch("https://wa.me/message/HYPZLULQV6N3E1")) {
            //       await launch(
            //         "https://wa.me/message/HYPZLULQV6N3E1",
            //         forceSafariVC: false,
            //         forceWebView: false,
            //         enableJavaScript: true,
            //       );
            //     }
            //   },
            //   child: Container(
            //     width: 150,
            //     padding: const EdgeInsets.all(10),
            //     decoration: BoxDecoration(
            //         border: Border.all(color: Colors.white.withOpacity(0.9)),
            //         borderRadius: BorderRadius.circular(20),
            //         gradient: const LinearGradient(
            //             begin: Alignment.topLeft,
            //             end: Alignment.center,
            //             colors: [Colors.white, Colors.green])),
            //     child: Row(
            //       children: [
            //         CircleAvatar(
            //           backgroundColor: Colors.white,
            //           child: Image.asset('lib/assets/whatsapp-logo.png'),
            //         ),
            //         const SizedBox(
            //           width: 10,
            //         ),
            //         const Text(
            //           "Whatsapp",
            //           style: TextStyle(
            //               color: Colors.white, fontWeight: FontWeight.bold),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            //
            //"https://t.me/Michael_izah"
            // GestureDetector(
            //   onTap: () async {
            //     if (await canLaunch("https://t.me/Michael_izah")) {
            //       await launch(
            //         "https://t.me/Michael_izah",
            //         forceSafariVC: false,
            //         forceWebView: false,
            //         enableJavaScript: false,
            //       );
            //     }
            //   },
            //   child: Container(
            //     // height: 100,
            //     width: 150,
            //     padding: const EdgeInsets.all(10),
            //     decoration: BoxDecoration(
            //         border: Border.all(color: Colors.white.withOpacity(0.9)),
            //         borderRadius: BorderRadius.circular(20),
            //         gradient: const LinearGradient(
            //             begin: Alignment.topLeft,
            //             end: Alignment.center,
            //             colors: [Colors.white, Colors.blue])),
            //     child: Row(
            //       children: [
            //         CircleAvatar(
            //           backgroundColor: Colors.white,
            //           child: Image.asset('lib/assets/telegram-logo.png'),
            //         ),
            //         const SizedBox(
            //           width: 10,
            //         ),
            //         const Text(
            //           "Telegram",
            //           style: TextStyle(
            //               color: Colors.white, fontWeight: FontWeight.bold),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ]),
        ],
      ),
    );
  }
}

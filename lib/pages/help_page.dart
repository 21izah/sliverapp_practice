// ignore_for_file: unused_field, deprecated_member_use, avoid_unnecessary_containers

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/data_constant.dart';
import '../containers/support_container.dart';
import 'chat_page.dart';
import 'customer_care_page.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: SpeedDial(
        spacing: 10,
        spaceBetweenChildren: 10,
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.blue,
        children: [
          SpeedDialChild(
              backgroundColor: Colors.amber,
              child: Icon(Icons.abc),
              label: 'Instagram'),
          SpeedDialChild(
              backgroundColor: Colors.pink,
              child: Icon(Icons.access_alarms),
              label: 'Tik-Tok'),
          SpeedDialChild(
              backgroundColor: Colors.brown,
              child: Icon(Icons.abc),
              label: 'Whatsapp'),
          SpeedDialChild(
              backgroundColor: Colors.green,
              child: Icon(Icons.abc),
              label: 'Facebook'),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('lib/assets/24hrs_customer_care_and_transaction.png'),
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
                    fontSize: screenSize.height * 0.02,
                  ),
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
            const SupportContainer(),

            // const SizedBox(
            //   height: 20,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FloatingActionButton(
                    child: SpeedDial(
                      direction: SpeedDialDirection.up,
                      foregroundColor: Colors.white,
                      spacing: 0,
                      spaceBetweenChildren: 0,
                      animatedIcon: AnimatedIcons.menu_close,
                      backgroundColor: Colors.deepOrange,
                      children: [
                        SpeedDialChild(
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
                            backgroundColor: Colors.transparent,
                            child: Lottie.asset(
                                'lib/assets/instagram-logo-effect.json'),
                            label: 'Instagram'),
                        SpeedDialChild(
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
                            backgroundColor: Colors.transparent,
                            child: Lottie.asset('lib/assets/tiktok-icon.json'),
                            label: 'Tik-Tok'),
                        SpeedDialChild(
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
                            backgroundColor: Colors.transparent,
                            child: Lottie.asset(
                                'lib/assets/whatsapp-button-call-attention-and-pause.json'),
                            label: 'Whatsapp'),
                        SpeedDialChild(
                            backgroundColor: Colors.transparent,
                            child: Lottie.asset(
                                'lib/assets/facebook-logo-effect.json'),
                            label: 'Facebook'),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}

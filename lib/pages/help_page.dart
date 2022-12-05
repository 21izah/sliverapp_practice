// ignore_for_file: unused_field, deprecated_member_use, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              child: const Text(
            'Chat with us / Confirm your transaction',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange),
          )),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () async {
              if (await canLaunch("https://wa.me/message/HYPZLULQV6N3E1")) {
                await launch(
                  "https://wa.me/message/HYPZLULQV6N3E1",
                  forceSafariVC: false,
                  forceWebView: false,
                  enableJavaScript: true,
                );
              }
            },
            child: Container(
              width: 150,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.9)),
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.center,
                      colors: [Colors.white, Colors.green])),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset('lib/assets/whatsapp-logo.png'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Whatsapp",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //
          //"https://t.me/Michael_izah"
          GestureDetector(
            onTap: () async {
              if (await canLaunch("https://t.me/Michael_izah")) {
                await launch(
                  "https://t.me/Michael_izah",
                  forceSafariVC: false,
                  forceWebView: false,
                  enableJavaScript: false,
                );
              }
            },
            child: Container(
              // height: 100,
              width: 150,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.9)),
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.center,
                      colors: [Colors.white, Colors.blue])),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset('lib/assets/telegram-logo.png'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Telegram",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../containers/option_selection.dart';
import 'create_pin_page.dart';
import 'forgot_password.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              PageTransition(
                child: ForgotPasswordPage(),
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
            TextHeader: 'Reset Password',
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              PageTransition(
                child: CreatePinScreen(),
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
            TextHeader: 'Reset Pin',
          ),
        ),
      ]),
    );
  }
}

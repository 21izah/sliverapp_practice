// ignore_for_file: unused_import

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sliverapp_practice/pages/sign_up_page.dart';
import 'package:sliverapp_practice/pages/loginpage.dart';
import 'package:sliverapp_practice/pages/welcomesixth_page.dart';
import 'package:sliverapp_practice/pages/welcome_page.dart';

class CurvedNavigationBarWidget extends StatefulWidget {
  const CurvedNavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<CurvedNavigationBarWidget> createState() =>
      _CurvedNavigationBarWidgetState();
}

class _CurvedNavigationBarWidgetState extends State<CurvedNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    return CurvedNavigationBar(
      index: selectedIndex,
      backgroundColor: Colors.black,
      color: Colors.deepOrange,
      items: const [
        Icon(Icons.home),
        Icon(Icons.history_edu),
        Icon(Icons.person),
        Icon(Icons.logout),
      ],
    );
  }
}

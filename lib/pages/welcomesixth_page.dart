// ignore_for_file: unused_import, no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sliverapp_practice/pages/curved_navigation_bar_widget.dart';
import 'package:sliverapp_practice/pages/eigth_page.dart';
import 'package:sliverapp_practice/pages/loginpage.dart';
import 'package:sliverapp_practice/pages/profile_page.dart';
import 'package:sliverapp_practice/pages/sell_page.dart';
import 'package:sliverapp_practice/pages/sign_in_homepage.dart';
import 'package:sliverapp_practice/pages/tab_bar.dart';
import 'package:sliverapp_practice/pages/welcome_page.dart';

class SixthPage extends StatefulWidget {
  const SixthPage({Key? key}) : super(key: key);

  @override
  State<SixthPage> createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
  final pages = [
    const WelcomePage(),
    const TabBarWidget(),
    ProfilePage(),
    //const SellPage()
  ];

  int selectedIndex = 0;
  _navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
          onTap: _navigateBottomBar,
          index: selectedIndex,
          color: Colors.deepOrange,
          backgroundColor: Colors.transparent,
          items: const [
            Icon(Icons.home),
            Icon(Icons.history_edu),
            Icon(Icons.person),
            // Icon(Icons.logout),
          ]),
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.purple,
      // ),
      body: pages[selectedIndex],
    );
  }
}

 // if (index == 0) {
            //   Navigator.of(context).push(
            //       MaterialPageRoute(builder: (context) => const WelcomePage()));
            // } else if (index == 2) {
            //   Navigator.of(context).push(
            //       MaterialPageRoute(builder: (context) => const EighthPage()));
            // }
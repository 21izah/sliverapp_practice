import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:sliverapp_practice/pages/loginpage.dart';

import '../pages/admin_home_page.dart';
import '../pages/help_page.dart';
import '../pages/profile_page.dart';
// import '../pages/sign_in_homepage.dart';
import '../pages/tab_bar.dart';
import '../pages/welcomesixth_page.dart';

class AdminHiddenDrawer extends StatefulWidget {
  const AdminHiddenDrawer({super.key});

  @override
  State<AdminHiddenDrawer> createState() => _AdminHiddenDrawerState();
}

class _AdminHiddenDrawerState extends State<AdminHiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            colorLineSelected: Colors.deepOrange,
            name: 'Home',
            baseStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
            selectedStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange)),
        const SixthPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            colorLineSelected: Colors.green,
            name: 'Admin Page',
            baseStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
            selectedStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange)),
        const AdminHomeScreen(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            colorLineSelected: Colors.deepOrange,
            name: 'Transaction History',
            baseStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
            selectedStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange)),
        const TabBarWidget(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            colorLineSelected: Colors.deepOrange,
            name: 'Profile',
            baseStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
            selectedStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange)),
        const ProfilePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            colorLineSelected: Colors.deepOrange,
            name: 'Help',
            baseStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
            selectedStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange)),
        const HelpPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            onTap: () => FirebaseAuth.instance.signOut().then(
                  (value) => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const LogInPage(),
                      ),
                      (route) => false),
                ),
            colorLineSelected: Colors.deepOrange,
            name: 'Log out',
            baseStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
            selectedStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange)),
        const LogInPage(),
      ),
    ];
  }

  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      slidePercent: 90,
      backgroundColorMenu: Colors.black,
      screens: _pages,
      initPositionSelected: 0,
      backgroundColorAppBar: Colors.deepOrange,
      backgroundColorContent: Colors.deepOrange,
    );
  }
}

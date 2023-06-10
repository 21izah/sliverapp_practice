// ignore_for_file: depend_on_referenced_packages, unused_import, annotate_overrides

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:sliverapp_practice/pages/help_page.dart';
import 'package:sliverapp_practice/pages/profile_page.dart';
import 'package:sliverapp_practice/pages/sign_in_homepage.dart';
import 'package:sliverapp_practice/pages/tab_bar.dart';
import 'package:sliverapp_practice/pages/welcome_page.dart';
import 'package:sliverapp_practice/pages/welcomesixth_page.dart';

import '../pages/loginpage.dart';
import '../constants/data_constant.dart';
import '../pages/wallet_page.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            colorLineSelected: primaryColor,
            name: 'Home',
            baseStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
            selectedStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor)),
        const SixthPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            colorLineSelected: Colors.green,
            name: 'Wallet Address',
            baseStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
            selectedStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor)),
        const WalletPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            colorLineSelected: primaryColor,
            name: 'Transaction History',
            baseStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            selectedStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor)),
        const TabBarWidget(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            colorLineSelected: primaryColor,
            name: 'Profile',
            baseStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
            selectedStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor)),
        const ProfilePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            colorLineSelected: primaryColor,
            name: 'Help',
            baseStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
            selectedStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor)),
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
            colorLineSelected: primaryColor,
            name: 'Log out',
            baseStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
            selectedStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor)),
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
      backgroundColorAppBar: primaryColor,
      backgroundColorContent: primaryColor,
    );
  }
}

// ignore_for_file: unused_import, no_leading_underscores_for_local_identifiers, prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'package:sliverapp_practice/pages/eigth_page.dart';
import 'package:sliverapp_practice/pages/loginpage.dart';
import 'package:sliverapp_practice/pages/profile_page.dart';
import 'package:sliverapp_practice/pages/sell_page.dart';
import 'package:sliverapp_practice/pages/sign_in_homepage.dart';
import 'package:sliverapp_practice/pages/tab_bar.dart';
import 'package:sliverapp_practice/pages/welcome_page.dart';
// import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../backend_page_operations/crud_testing.dart';
import '../widgets/myBottom_navBar.dart';
import 'help_page.dart';
import '../constants/data_constant.dart';
import 'package:unicons/unicons.dart';

import 'profile_page1.dart';
import 'wallet_page.dart';

class SixthPage extends StatefulWidget {
  const SixthPage({Key? key}) : super(key: key);

  @override
  State<SixthPage> createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
  final pages = [
    const WelcomePage(),
    const TabBarWidget(),
    WalletPage(),
    HelpPage(),
    ProfilePage1(),
    //const SellPage()
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: pages[selectedIndex],
      extendBody: true,
      bottomNavigationBar: GNav(
          selectedIndex: selectedIndex,
          onTabChange: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          mainAxisAlignment: MainAxisAlignment.center,
          tabActiveBorder: Border.all(color: Colors.white),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          // backgroundColor: Colors.blue,
          activeColor: Theme.of(context).colorScheme.background,
          haptic: true,
          backgroundColor: Theme.of(context).colorScheme.background,
          tabBorder: Border.symmetric(),
          tabBorderRadius: 5,
          tabBackgroundColor: primaryColor,
          color: Theme.of(context).colorScheme.background,
          gap: 5,
          tabMargin: EdgeInsets.fromLTRB(5, 5, 5, 20),
          tabs: [
            GButton(
              icon: UniconsLine.home,
              text: 'Home',
              textColor: Theme.of(context).colorScheme.tertiary,
              iconColor: Theme.of(context).colorScheme.tertiary,
            ),
            GButton(
              icon: UniconsLine.transaction,
              text: 'Transactions',
              textColor: Theme.of(context).colorScheme.tertiary,
              iconColor: Theme.of(context).colorScheme.tertiary,
            ),
            GButton(
              icon: UniconsLine.wallet,
              text: 'Wallet',
              textColor: Theme.of(context).colorScheme.tertiary,
              iconColor: Theme.of(context).colorScheme.tertiary,
            ),
            GButton(
              icon: UniconsLine.laptop,
              text: 'Support',
              textColor: Theme.of(context).colorScheme.tertiary,
              iconColor: Theme.of(context).colorScheme.tertiary,
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
              textColor: Theme.of(context).colorScheme.tertiary,
              iconColor: Theme.of(context).colorScheme.tertiary,
            ),
          ]),
    );
  }
}

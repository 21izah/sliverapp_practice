import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBAr extends StatefulWidget {
  const MyBottomNavBAr({super.key});

  @override
  State<MyBottomNavBAr> createState() => _MyBottomNavBArState();
}

class _MyBottomNavBArState extends State<MyBottomNavBAr> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(tabs: [
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.receipt,
          text: 'Transactions',
        ),
        GButton(
          icon: Icons.wallet_giftcard,
          text: 'Wallet',
        ),
        GButton(
          icon: Icons.laptop,
          text: 'Support',
        ),
        GButton(
          icon: Icons.person,
          text: 'Profile',
        ),
      ]
          // rippleColor: color: Colors.grey[800], // tab button ripple color when pressed
          // hoverColor: Colors.grey[700], // tab button hover color
          // haptic: true, // haptic feedback
          // tabBorderRadius: 15,
          // tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
          // tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
          // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
          // curve: Curves.easeOutExpo, // tab animation curves
          // duration: Duration(milliseconds: 900), // tab animation duration
          // gap: 8, // the tab button gap between icon and text
          // color: Colors.grey[800], // unselected icon color
          // activeColor: Colors.purple, // selected icon and text color
          // iconSize: 24, // tab button icon size
          // tabBackgroundColor: Colors.purple.withOpacity(0.1), // selected tab background color
          // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding

          ),
    );
  }
}

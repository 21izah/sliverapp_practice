import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sliverapp_practice/pages/help_page.dart';
import 'package:sliverapp_practice/pages/loginpage.dart';
import 'package:sliverapp_practice/pages/profile_page.dart';

// import 'package:sliverapp_practice/pages/sign_in_homepage.dart';
import 'package:sliverapp_practice/pages/tab_bar.dart';
import 'package:sliverapp_practice/pages/welcomesixth_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      width: 300,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey[900],
        ),
        // color: Colors.grey[900],
        child: ListView(
          children: [
            DrawerHeader(
                curve: Curves.bounceIn,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                duration: const Duration(milliseconds: 5),
                decoration: BoxDecoration(color: Colors.grey[900]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[900],
                        child: const Icon(
                          Icons.person,
                          size: 80,
                          color: Colors.deepOrange,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Welcome Investor',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                  ],
                )),
            // const Divider(
            //   indent: 20,
            //   color: Colors.black,
            //   thickness: 2,
            // ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.deepOrange,
              ),
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.deepOrange),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SixthPage(),
              )),
            ),
            const Divider(
              indent: 20,
              color: Colors.black,
              thickness: 2,
            ),
            ListTile(
              leading: const Icon(
                Icons.wallet,
                color: Colors.deepOrange,
              ),
              title: const Text(
                'Wallet Address',
                style: TextStyle(color: Colors.deepOrange),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HelpPage(),
              )),
            ),
            const Divider(
              indent: 20,
              color: Colors.black,
              thickness: 2,
            ),
            ListTile(
              leading: const Icon(
                Icons.history_edu_rounded,
                color: Colors.deepOrange,
              ),
              title: const Text(
                'Transaction History',
                style: TextStyle(color: Colors.deepOrange),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TabBarWidget(),
              )),
            ),
            const Divider(
              indent: 20,
              color: Colors.black,
              thickness: 2,
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.deepOrange,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.deepOrange),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              )),
            ),
            const Divider(
              indent: 20,
              color: Colors.black,
              thickness: 2,
            ),
            ListTile(
              leading: const Icon(
                Icons.help,
                color: Colors.deepOrange,
              ),
              title: const Text(
                'Help',
                style: TextStyle(color: Colors.deepOrange),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HelpPage(),
              )),
            ),
            const Divider(
              indent: 20,
              color: Colors.black,
              thickness: 2,
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.deepOrange),
              title: const Text(
                'Log out',
                style: TextStyle(color: Colors.deepOrange),
              ),
              onTap: () => FirebaseAuth.instance.signOut().then(
                    (value) => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const LogInPage(),
                        ),
                        (route) => false),
                  ),
            ),
            const Divider(
              indent: 20,
              color: Colors.black,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}

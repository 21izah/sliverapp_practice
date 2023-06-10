// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sliverapp_practice/backend_page_operations/login_page_backend_operation.dart';
import 'package:sliverapp_practice/pages/eigth_page.dart';
import 'package:sliverapp_practice/pages/help_page.dart';
import 'package:sliverapp_practice/pages/loginpage.dart';

import 'package:sliverapp_practice/pages/sign_in_homepage.dart';
import 'package:sliverapp_practice/pages/buy_page.dart';
import 'package:sliverapp_practice/pages/welcomesixth_page.dart';
import 'package:sliverapp_practice/pages/welcome_page.dart';

class AdminDrawerWidget extends StatelessWidget {
  const AdminDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 139, 63, 5),
        //
        // const Color(0xFF211E27)

        child: ListView(
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                child: Center(
                    child: Text(
                  'Welcome Investor',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ))),
            // const Divider(
            //   indent: 20,
            //   color: Colors.black,
            //   thickness: 2,
            // ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.black),
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
              leading: const Icon(Icons.wallet),
              title: const Text(
                'Wallet Address',
                style: TextStyle(color: Colors.black),
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
              leading: const Icon(Icons.history_edu_rounded),
              title: const Text(
                'Rates',
                style: TextStyle(color: Colors.black),
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
              leading: const Icon(Icons.person),
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BuyPage(),
              )),
            ),
            const Divider(
              indent: 20,
              color: Colors.black,
              thickness: 2,
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text(
                'Help',
                style: TextStyle(color: Colors.black),
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
                leading: const Icon(Icons.logout),
                title: const Text(
                  'Log out',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () => FirebaseAuth.instance.signOut().then(
                      (value) => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const LogInPage(),
                          ),
                          (route) => false),
                    )),
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

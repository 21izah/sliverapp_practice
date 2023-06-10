import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliverapp_practice/pages/sign_in_homepage.dart';

import 'admin_login.dart';
import 'loginpage.dart';
// ignore: unused_import
import '../constants/data_constant.dart';

class LoginSelectionScreen extends StatefulWidget {
  const LoginSelectionScreen({super.key});

  @override
  State<LoginSelectionScreen> createState() => _LoginSelectionScreenState();
}

class _LoginSelectionScreenState extends State<LoginSelectionScreen> {
  List<String> fruitItems = [
    'user',
    'admin',
  ];
  var initialSelectedItem = 'user';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(150, 20, 150, 20),
              padding: const EdgeInsets.fromLTRB(20, 3, 10, 3),
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              child: DropdownButton(
                value: initialSelectedItem,
                items: fruitItems
                    .map((initialSelectedItem) => DropdownMenuItem<String>(
                        value: initialSelectedItem,
                        child: Text(initialSelectedItem)))
                    .toList(), // list of DropDownMenuItem widget

                onChanged: (newValueSelected) => setState(() {
                  initialSelectedItem = newValueSelected!;
                }),

                // hint: Text('hello'),
                underline: Container(),
                focusColor: Colors.amber,
                elevation: 2,
                isExpanded: true,
                dropdownColor: Colors.deepOrange,
                borderRadius: BorderRadius.circular(20),
                iconSize: 15,
                iconEnabledColor: Colors.deepOrange,
                iconDisabledColor: Colors.pink,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (initialSelectedItem == 'user') {
                Get.to(SignInPage());
              } else if (initialSelectedItem == 'admin') {
                Get.to(AdminLoginScreen());
              }
            },
            child: Container(
              color: Colors.amber,
              height: 70,
              width: 150,
              child: Center(child: Text('click')),
            ),
          ),
        ],
      ),
    );
  }
}

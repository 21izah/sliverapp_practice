// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:sliverapp_practice/widgets/popup_menu_button.dart';
import 'package:get/get.dart';

import '../backend_page_operations/get_user_name.dart';

import 'sell_page2.dart';
import 'welcome_page.dart';

class EighthPage extends StatefulWidget {
  const EighthPage({Key? key}) : super(key: key);

  @override
  State<EighthPage> createState() => _EighthPageState();
}

class _EighthPageState extends State<EighthPage> {
  List<String> fruitItems = ['orange', 'mango', 'guava', 'apple'];
  var initialSelectedItem = 'orange';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 126, 8, 8),
      appBar: AppBar(
        actions: const [
          PopUpMenuButtonWidget(),
        ],
        // title: Text('eight'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // const DropDownMenuWidget(),
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
              if (initialSelectedItem == 'orange') {
                Get.to(WelcomePage());
              } else if (initialSelectedItem == 'mango') {
                Get.to(SellPage2());
              } else if (initialSelectedItem == 'guava') {
                Get.to(ApiPractice());
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
    // );
  }
}

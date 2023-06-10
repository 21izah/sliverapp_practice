import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliverapp_practice/constants/data_constant.dart';
import 'package:sliverapp_practice/pages/profile_page.dart';

import '../pages/create_pin_page.dart';

class DropDownButton2 extends StatefulWidget {
  const DropDownButton2({super.key});

  @override
  State<DropDownButton2> createState() => _DropDownButton2State();
}

class _DropDownButton2State extends State<DropDownButton2> {
  final List<String> items = [
    'My Profile',
    'Bank Account',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
      ),
      barrierColor: Colors.transparent,
      underline: Container(),
      hint: Text(
        'Personal Information',
        style: TextStyle(fontSize: 14, color: blackColor),
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value as String;

          if (selectedValue == 'My Profile') {
            Navigator.of(context).push(PageTransition(
              child: ProfilePage(),
              type: PageTransitionType.rightToLeft,
            ));
          } else if (selectedValue == 'Bank Account') {
            Navigator.of(context).push(PageTransition(
              child: CreatePinScreen(),
              type: PageTransitionType.rightToLeft,
            ));
          }
        });
      },
      buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.all(10),
          height: 70,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          )),
      menuItemStyleData: const MenuItemStyleData(
        height: 40,
      ),
    );
  }
}

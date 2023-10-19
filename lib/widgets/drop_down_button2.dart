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
    final screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).colorScheme.tertiary,
          )),
      child: DropdownButton2(
        // customButton: Icon(
        //   Icons.person_2_rounded,
        //   size: 50,
        //   shadows: [
        //     BoxShadow(
        //       color: Colors.deepOrange,
        //       offset: Offset(2, 2),
        //     )
        //   ],
        // ),
        iconStyleData: IconStyleData(
          // icon: Icon(Icons.arrow_downward_outlined),
          iconEnabledColor: Colors.amber,
          iconDisabledColor: Colors.blue,
        ),
        style: TextStyle(
          color: Colors.amber,
        ),
        barrierColor: Colors.transparent,
        underline: Container(),
        hint: Text(
          'Personal Information',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.tertiary,
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
        dropdownStyleData: DropdownStyleData(
          width: screenSize.width * 0.4,
          offset: Offset(10, 10),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        buttonStyleData: ButtonStyleData(
            padding: const EdgeInsets.all(10),
            height: screenSize.height * 0.07,
            width: screenSize.width - 10,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(10),
            )),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}

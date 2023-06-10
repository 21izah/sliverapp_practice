import 'package:flutter/material.dart';

class DropDownMenuWidget extends StatefulWidget {
  const DropDownMenuWidget({Key? key}) : super(key: key);

  @override
  State<DropDownMenuWidget> createState() => _DropDownMenuWidgetState();
}

class _DropDownMenuWidgetState extends State<DropDownMenuWidget> {
  List<String> fruitItems = ['orange', 'mango', 'guava', 'apple'];
  var initialSelectedItem = 'orange';

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Center(
      child: Container(
        // margin: const EdgeInsets.fromLTRB(150, 20, 150, 0),
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
                  value: initialSelectedItem, child: Text(initialSelectedItem)))
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
    );
  }
}

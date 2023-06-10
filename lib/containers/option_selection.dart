// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';

class OptionSelection extends StatelessWidget {
  final iconImage;
  final String TextHeader;

  final textHeaderColor;

  const OptionSelection({
    Key? key,
    required this.iconImage,
    required this.TextHeader,
    required this.textHeaderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final systemPadding = MediaQuery.of(context).padding;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final fontScaleFactor = screenSize.width > 600 ? 1.5 : 1;

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 5, bottom: 5),
      child: Container(
        height: screenSize.height * 0.075,
        width: screenSize.width - 50,
        // color: Colors.amber,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[300]),
                  height: 45,
                  width: 40,
                  child: iconImage,

                  //  Icon(Icons.person_2_outlined),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TextHeader,
                    style: TextStyle(
                        fontSize: screenSize.width * 0.03
                        //  15 * (textScaleFactor)

                        ,
                        fontWeight: FontWeight.bold,
                        color: textHeaderColor),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.arrow_forward_ios_sharp,
              color: Theme.of(context).colorScheme.background,
            ),
          )
        ]),
      ),
    );
  }
}

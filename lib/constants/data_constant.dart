import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final primaryColor = Colors.deepOrange;
final whiteColor = Colors.white;
final whiteShade = Color.fromARGB(255, 240, 231, 231);
final blackColor = Colors.black;
final text1 = Text(
  'data',
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
);
final text2 = Text(
  'data',
  style: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  ),
);
final text3 = Text(
  'data',
  style: TextStyle(
    fontSize: 15,
  ),
);

class ScreenSize {
  double screenWidth;
  double screenHeight;
  ScreenSize(
    this.screenWidth,
    this.screenHeight,
  );
}

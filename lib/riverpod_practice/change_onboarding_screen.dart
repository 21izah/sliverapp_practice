import 'package:flutter/material.dart';

class ColorChangeModel extends ChangeNotifier {
  double _swipePosition = 0.0;
  double get swipePosition => _swipePosition;

  List<Color> colors = [
    Colors.deepOrange.shade500,
    Colors.deepOrange.shade500,
    Colors.deepOrange.shade600,
    Colors.deepOrange.shade700,
    Colors.deepOrange,
  ];

  Color get interpolatedColor {
    int colorindex = swipePosition.floor();
    // Color startColor = Colors.blue;
    // Color targetColor = Colors.green;
    // Color finalColor = Colors.red;

    double t = swipePosition - colorindex.toDouble();

    return Color.lerp(colors[colorindex], colors[colorindex], t)!;
  }

  void updateSwipePosition(double position) {
    _swipePosition = position;
    notifyListeners();
  }
}

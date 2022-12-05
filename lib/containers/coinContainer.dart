// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CoinContainer extends StatelessWidget {
  final coinImage;
  final String coinName;
  const CoinContainer({
    Key? key,
    required this.coinImage,
    required this.coinName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 25, 5, 5),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                color: Colors.transparent),
            height: 50,
            width: 50,
            child: coinImage,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            coinName,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

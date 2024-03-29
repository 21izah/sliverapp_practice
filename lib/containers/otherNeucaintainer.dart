import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../constants/data_constant.dart';

class OtherNeuContainer extends StatelessWidget {
  final String coinName;
  final coinImage;
  const OtherNeuContainer({
    Key? key,
    required this.coinName,
    required this.coinImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20,
        top: 5,
        bottom: 5,
      ),
      child: Container(
        height: 150,
        width: 400,
        decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.purple),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            speed: const Duration(milliseconds: 50),
                            '$coinName Trading',
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: whiteColor),
                          ),
                        ],
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            speed: const Duration(milliseconds: 50),
                            'Buy & Sell $coinName',
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: whiteColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    child: coinImage,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

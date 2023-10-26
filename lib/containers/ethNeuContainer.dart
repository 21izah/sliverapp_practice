import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../constants/data_constant.dart';

class EthNeuContainer extends StatelessWidget {
  final _username = Hive.box('username');
  final String coinName;
  final coinImage;
  EthNeuContainer({
    Key? key,
    required this.coinName,
    required this.coinImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20,
        top: 5,
        bottom: 5,
      ),
      child: Container(
        height: screenSize.height * 0.13,
        width: screenSize.width - 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.blue),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              speed: const Duration(milliseconds: 50),
                              '$coinName Trading'.tr,
                              textStyle: TextStyle(
                                  fontSize: screenSize.height * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: whiteColor),
                            ),
                          ],
                        ),
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            speed: const Duration(milliseconds: 50),
                            'Buy & Sell $coinName'.tr,
                            textStyle: TextStyle(
                                fontSize: screenSize.height * 0.015,
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
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Ethereum: \$${_username.get(13).toString()}'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenSize.height * 0.015,
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

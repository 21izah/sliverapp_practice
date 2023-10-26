// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'dart:convert' as convert;
import '../constants/data_constant.dart';
import '../data/api_calls/jsonProvider.dart';
import '../pages/buy_page2.dart';

class NeuCoinCardContainer extends StatelessWidget {
  final _username = Hive.box('username');
  Future getBitcoinPrice() async {
    var url =
        'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Cethereum&vs_currencies=usd%2Cngn';
    var response = await http.get(Uri.parse(url));

    print(response.body);
    var jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
    print(jsonData);

    var jsonbit1 = jsonData['bitcoin']['usd'];
    await jsonbit1;

    _username.put(12, jsonbit1);
    print(jsonData['bitcoin']['usd']);
    print(_username.get(12).toString());

    if (response.statusCode == 200) {
      return jsonData;
    } else {
      throw Exception('Failed to load Api Data');
    }
  }

  final String coinName;
  final coinImage;
  NeuCoinCardContainer({
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
        // top: 5,
        bottom: 5,
      ),
      child: Container(
        height: screenSize.height * 0.13,
        width: screenSize.width - 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: primaryColor),
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
                            '$coinName Trading'.tr,
                            textStyle: TextStyle(
                                fontSize: screenSize.height * 0.02,
                                fontWeight: FontWeight.bold,
                                color: whiteColor),
                          ),
                        ],
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
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Bitcoin: \$${_username.get(14).toString()}'.tr,
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

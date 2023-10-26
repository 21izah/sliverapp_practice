import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:sliverapp_practice/containers/card_details.dart';
import 'package:sliverapp_practice/containers/neuCoinContainer.dart';

import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../containers/busd_container.dart';
import '../containers/ethNeuContainer.dart';

import '../containers/otherNeucaintainer.dart';
import '../containers/usdt_container.dart';
import '../riverpod_practice/accuont_balance.dart';
import '../riverpod_practice/balance_obscure_provider.dart';
import '../riverpod_practice/changeButton_text.dart';
import '../riverpod_practice/change_light_dark_mode_provider.dart';
import 'buy_page2 usdt.dart';
import 'buy_page2.dart';

import 'package:flutter_animate/flutter_animate.dart';
import '../constants/data_constant.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:async';

import 'buy_page2_ethereum.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sliverapp_practice/model/coinModel.dart';

import 'complex_json_practice.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _username = Hive.box('username');
  final _cardController = PageController(initialPage: 0);
  Timer? _timer;
  final ChangeButtonTextProvider _changeButtonText = ChangeButtonTextProvider();

  @override
  void initState() {
    // final provider = Provider.of<ChangeLightDarkMode>(context);
    // provider.loadTheme();

    super.initState();
    startNavigationDelay();
    // getCoinMarket();
  }

  @override
  void dispose() {
    _cardController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void startNavigationDelay() {
    _timer = Timer.periodic(Duration(seconds: 2), (_) {
      final nextPage = _cardController.page!.toInt() + 1;
      if (nextPage < 3) {
        _cardController.animateToPage(nextPage,
            duration: Duration(seconds: 3), curve: Curves.ease);
      } else {
        _cardController.animateToPage(0,
            duration: Duration(seconds: 1), curve: Curves.ease);
      }
      // _cardController.nextPage(
      //     duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: screenSize.height * 0.40,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                              // bottom: 5,
                              top: 10,
                            ),
                            child: Container(
                              // color: Colors.amber,
                              child: Row(
                                children: [
                                  Text(
                                    'Hello'.tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.grey[700]),
                                  ).animate().slideX(duration: 2000.ms),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: screenSize.width - 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color: Colors.amber,
                                ),
                                margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                                // padding: EdgeInsets.all(20),
                                child: FutureBuilder<DocumentSnapshot>(
                                  future: FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(user!.uid)
                                      .get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      Map<String, dynamic> data = snapshot.data!
                                          .data() as Map<String, dynamic>;
                                      return Text(
                                        '${data['First Name']} ${data['Surname']}',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                      );
                                    } else {
                                      return Text('loading');
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Consumer<AccountBalance>(
                        builder: (context, acct, child) => Container(
                          decoration: const BoxDecoration(
                              // color: Colors.amber,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          // height: screenSize.height * 0.23,
                          child: CardDetails(
                            cardColor: primaryColor,
                            cardBalance: acct.accountBalance,
                            cardNumber: 2355,
                            cardExpiryMonth: 23,
                            cardExpiryYear: 20,
                            cardImage: Lottie.asset('lib/assets/bitcoin.json',
                                fit: BoxFit.fill),
                          ),
                        ).animate().slideX(duration: 500.ms),
                      ),
                    ]),
              ),
            ],
          ),
          Positioned(
            // left: screenSize.width * 0.0009,
            top: screenSize.height * 0.37,
            // right: screenSize.width * 0.0009,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                // borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              height: screenSize.height * 0.8,
              width: screenSize.width - 10,
              child: ListView(children: [
                Column(children: [
                  SizedBox(
                    height: 100,
                    // color: Colors.amber,
                    child: PageView(
                      controller: _cardController,
                      scrollDirection: Axis.horizontal,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            PageTransition(
                              child: UsdtBuyPage2(),
                              type: PageTransitionType.rightToLeft,
                            ),
                          ),
                          child: UsdtContainer(
                            coinName: 'USDT',
                            coinImage:
                                Image.asset('lib/assets/bitcoin_cash.png'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            PageTransition(
                              child: BuyPage2(),
                              type: PageTransitionType.rightToLeft,
                            ),
                          ),
                          child: BusdContainer(
                            coinName: 'BUSD',
                            coinImage:
                                Image.asset('lib/assets/bitcoin_cash.png'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            PageTransition(
                              child: ComplexJsonData(),
                              type: PageTransitionType.rightToLeft,
                            ),
                          ),
                          child: OtherNeuContainer(
                            coinName: 'Other',
                            coinImage:
                                Image.asset('lib/assets/bitcoin_cash.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _cardController,
                    count: 3,
                    effect: WormEffect(
                      dotColor: Theme.of(context).colorScheme.tertiary,
                      activeDotColor: Colors.deepOrange,
                      offset: 3,
                      radius: 4,
                      dotHeight: 4,
                      dotWidth: 4,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        PageTransition(
                          child: BuyPage2(),
                          type: PageTransitionType.rightToLeft,
                        ),
                      ),
                      child: NeuCoinCardContainer(
                        coinName: 'Bitcoin',
                        coinImage: Image.asset('lib/assets/bitcoin_cash.png'),
                      ).animate().slide(duration: 550.ms),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        PageTransition(
                          child: EthereumBuyPage2(),
                          type: PageTransitionType.rightToLeft,
                        ),
                      ),
                      child: EthNeuContainer(
                        coinName: 'Ethereum',
                        coinImage: Image.asset('lib/assets/Ethereum_.png'),
                      ).animate().slideX(duration: 600.ms),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                  ]),
                ]),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  // List? coinMarket = [];
  // var coinMarketList;

  // Future<List<CoinModel>?> getCoinMarket() async {
  //   const url =
  //       'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';
  //   var response = await http.get(Uri.parse(url), headers: {
  //     "content-Type": "application/json",
  //     "Accept": "application/json",
  //   });
  //   print(response.body);

  //   // var jsonData = convert.jsonDecode(response.body);
  //   // print(jsonData);
  //   // var jsonbit1 = jsonData['bitcoin']['usd'];
  //   // await jsonbit1;

  //   // await _username.put(20, jsonData['bitcoin']['usd']);
  //   // print(jsonData['bitcoin']['usd']);
  //   // print(_username.get(20).toString());

  //   if (response.statusCode == 200) {
  //     var x = response.body;
  //     // return jsonData;
  //     coinMarketList = coinModelFromJson(x);
  //     // print(coinMarketList.name);
  //     setState(() {
  //       coinMarket = coinMarketList;
  //     });
  //     // CoinModel.fromJson(jsonData).name;
  //   } else {
  //     throw Exception('Failed to load Api Data');
  //   }
  // }
}

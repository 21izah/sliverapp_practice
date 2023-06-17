import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sliverapp_practice/containers/card_details.dart';
import 'package:sliverapp_practice/containers/neuCoinContainer.dart';

import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../containers/busd_container.dart';
import '../containers/ethNeuContainer.dart';

import '../containers/otherNeucaintainer.dart';
import '../containers/usdt_container.dart';
import '../riverpod_practice/balance_obscure_provider.dart';
import '../riverpod_practice/change_light_dark_mode_provider.dart';
import 'buy_page2.dart';

import 'package:flutter_animate/flutter_animate.dart';
import '../constants/data_constant.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:async';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _cardController = PageController(initialPage: 0);
  Timer? _timer;

  @override
  void initState() {
    // final provider = Provider.of<ChangeLightDarkMode>(context);
    // provider.loadTheme();

    super.initState();
    startNavigationDelay();
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
            duration: Duration(seconds: 3), curve: Curves.linear);
      } else {
        _cardController.animateToPage(0,
            duration: Duration(seconds: 1), curve: Curves.linear);
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
                  // borderRadius: BorderRadius.only(
                  //   bottomRight: Radius.circular(20),
                  //   bottomLeft: Radius.circular(20),
                  // ),
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
                                    'Hello,',
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
                                      .doc(user!.email)
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
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        height: 210,
                        child: CardDetails(
                          cardColor: primaryColor,
                          cardBalance: 5000000,
                          cardNumber: 2355,
                          cardExpiryMonth: 23,
                          cardExpiryYear: 20,
                          cardImage: Lottie.asset('lib/assets/bitcoin.json',
                              fit: BoxFit.fill),
                        ),
                      ).animate().slideX(duration: 500.ms),
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
                //  borderRadius: BorderRadius.circular(10),
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
                              child: BuyPage2(),
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
                              child: BuyPage2(),
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
                      dotColor: Colors.black,
                      activeDotColor: Colors.deepOrange,
                      offset: 3,
                      radius: 4,
                      dotHeight: 4,
                      dotWidth: 4,
                    ),
                    // effect: const ExpandingDotsEffect(
                    //     activeDotColor: Colors.deepOrange, dotHeight: 10),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.only(
                  //         left: 20.0,
                  //         right: 5,
                  //         bottom: 20,
                  //       ),
                  //       child: Container(
                  //         child: Column(children: [
                  //           Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: CircleAvatar(
                  //                 radius: 30,
                  //                 child: Image.asset('lib/assets/usdt_.png')),
                  //           ),
                  //           Text(
                  //             'USDT',
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //             ),
                  //           )
                  //         ]),
                  //         decoration: BoxDecoration(
                  //             color: Colors.green,
                  //             borderRadius: BorderRadius.circular(10)),
                  //         height: 105,
                  //         width: 105,
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(
                  //         left: 0.0,
                  //         right: 5,
                  //         bottom: 20,
                  //       ),
                  //       child: Container(
                  //         child: Column(children: [
                  //           Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: CircleAvatar(
                  //                 radius: 30,
                  //                 child: Image.asset('lib/assets/busd1_.png')),
                  //           ),
                  //           Text(
                  //             'BUSD',
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //         ]),
                  //         height: 105,
                  //         width: 105,
                  //         decoration: BoxDecoration(
                  //             color: Colors.deepOrange,
                  //             borderRadius: BorderRadius.circular(10)),
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(
                  //         left: 0.0,
                  //         right: 20,
                  //         bottom: 20,
                  //       ),
                  //       child: Container(
                  //         child: Column(children: [
                  //           Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: CircleAvatar(
                  //                 radius: 30,
                  //                 child: Image.asset('lib/assets/monero.png')),
                  //           ),
                  //           Text(
                  //             'Others',
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //             ),
                  //           )
                  //         ]),
                  //         height: 105,
                  //         width: 105,
                  //         decoration: BoxDecoration(
                  //             color: Colors.red,
                  //             borderRadius: BorderRadius.circular(10)),
                  //       ),
                  //     ),
                  //   ],
                  // ),
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
                          child: BuyPage2(),
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
          // Positioned(
          //   left: 0.8 * screenSize.width,
          //   top: 0.85 * screenSize.height,
          //   // bottom: 0.2 * screenSize.height,
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(0, 10, 30, 10),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.end,
          //       children: [
          //         FloatingActionButton(
          //           heroTag: 'customer page button',
          //           backgroundColor: primaryColor,
          //           foregroundColor: Colors.black,
          //           splashColor: Colors.amber,
          //           child: const Icon(Icons.message),
          //           onPressed: () {
          //             Navigator.of(context).push(
          //               PageTransition(
          //                 child: CustomerCarePage(),
          //                 type: PageTransitionType.rightToLeft,
          //               ),
          //             );
          //           },
          //         ),
          //       ]
          //           .animate(interval: NumDurationExtensions(6).seconds)
          //           .slideX()
          //           .then()
          //           .shake(),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}


// Container(
//     margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//     child: const Vbitcoin()),
// Container(
//   margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//   child: const VEthereum(),
// ),
// Container(
//     margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//     child: const VUsdtBep20()),
// Container(
//     margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//     child: const VUsdtTrc20()),
// Container(
//     margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//     child: const VBusdBap20()),

// fufhweuf
 // GestureDetector(
                //   onTap: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => const BitcoinBuyPage(),
                //     ));
                //   },
                //   child: CoinBuySell(
                //       coinName: 'Bitcoin',
                //       gradientColor: const Color.fromARGB(255, 225, 122, 4),
                //       coinImage: Image.asset('lib/assets/bitcoin_cash.png')),
                // ),
                // CoinBuySell(
                //     coinName: 'Ethereum',
                //     gradientColor: const Color.fromARGB(221, 41, 37, 37),
                //     coinImage: Image.asset('lib/assets/Ethereum_.png')),
                // CoinBuySell(
                //     coinName: 'USDT',
                //     gradientColor: const Color.fromARGB(255, 20, 141, 63),
                //     coinImage: Image.asset('lib/assets/usdt_.png')),
                // CoinBuySell(
                //     coinName: 'BUSD',
                //     gradientColor: Colors.yellow,
                //     coinImage: Image.asset('lib/assets/busd1_.png')),
                // CoinBuySell(
                //     coinName: 'Other Crypto',
                //     gradientColor: Colors.deepPurple,
                //     coinImage: Image.asset('lib/assets/dash.png')),
                // const SizedBox(
                //   height: 50,
                // ),
                //
                // ffgiefgiww
                 //  Column(
          // children: [
          //   SizedBox(
          //     height: 300,
          //     // color: Colors.amber,
          //     child: PageView(
          //       controller: _cardController,
          //       scrollDirection: Axis.horizontal,
          //       children: [
          //         const CardDetails(
          //           cardColor: Colors.deepOrange,
          //           cardBalance: 455656.00,
          //           cardNumber: 2355,
          //           cardExpiryMonth: 23,
          //           cardExpiryYear: 20,
          //         ),
          //         const CardDetails(
          //           cardColor: Colors.green,
          //           cardBalance: 455656.00,
          //           cardNumber: 2355,
          //           cardExpiryMonth: 23,
          //           cardExpiryYear: 20,
          //         ),
          //         const CardDetails(
          //           cardColor: Colors.blue,
          //           cardBalance: 455656.00,
          //           cardNumber: 2355,
          //           cardExpiryMonth: 23,
          //           cardExpiryYear: 20,
          //         ),
          //       ],
          //     ),
          //   ),
          //   const SizedBox(
          //     height: 9,
          //   ),
            // SmoothPageIndicator(
            //   controller: _cardController,
            //   count: 3,
            //   effect: const ExpandingDotsEffect(
            //       activeDotColor: Colors.deepOrange, dotHeight: 10),
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
        //     SizedBox(
        //       height: 150,
        //       child: ListView(
        //         scrollDirection: Axis.horizontal,
        //         children: [
        //           CoinContainer(
        //               coinImage: Image.asset('lib/assets/bitcoin_cash.png'),
        //               coinName: 'Bitcoin Cash'),
        //           CoinContainer(
        //               coinImage: Image.asset('lib/assets/litcoin_.png'),
        //               coinName: 'Litcoin'),
        //           CoinContainer(
        //               coinImage: Image.asset('lib/assets/cardano.png'),
        //               coinName: 'Cardano'),
        //           CoinContainer(
        //               coinImage: Image.asset('lib/assets/dash.png'),
        //               coinName: 'Dash'),
        //           CoinContainer(
        //               coinImage: Image.asset('lib/assets/monero.png'),
        //               coinName: 'Monero'),
        //           CoinContainer(
        //               coinImage: Image.asset('lib/assets/digibite.png'),
        //               coinName: 'Digibite'),
        //           CoinContainer(
        //               coinImage: Image.asset('lib/assets/nano_.png'),
        //               coinName: 'Nano'),
        //           CoinContainer(
        //               coinImage: Image.asset('lib/assets/dogecoin.png'),
        //               coinName: 'Dogecoin'),
        //           CoinContainer(
        //               coinImage: Image.asset('lib/assets/tron_.png'),
        //               coinName: 'Tron'),
        //           CoinContainer(
        //               coinImage: Image.asset('lib/assets/xrp.png'),
        //               coinName: 'Xrp'),
        //         ],
        //       ),
        //     ),
        //     Expanded(
        //       child: ListView(
        //         children: [
        //           CoinBuySell(
        //               coinName: 'Bitcoin Cash',
        //               gradientColor: Colors.deepOrange,
        //               coinImage: Image.asset('lib/assets/bitcoin_cash.png')),
        //           CoinBuySell(
        //               coinName: 'Litcoin',
        //               gradientColor: const Color.fromARGB(255, 112, 107, 106),
        //               coinImage: Image.asset('lib/assets/litcoin_.png')),
        //           CoinBuySell(
        //               coinName: 'Cardano',
        //               gradientColor: Colors.blue,
        //               coinImage: Image.asset('lib/assets/cardano.png')),
        //           CoinBuySell(
        //               coinName: 'Dash',
        //               gradientColor: Colors.deepPurple,
        //               coinImage: Image.asset('lib/assets/dash.png')),
        //           CoinBuySell(
        //               coinName: 'Monero',
        //               gradientColor: Colors.deepOrange,
        //               coinImage: Image.asset('lib/assets/monero.png')),
        //           CoinBuySell(
        //               coinName: 'Digibite',
        //               gradientColor: Colors.blueAccent,
        //               coinImage: Image.asset('lib/assets/digibite.png')),
        //           CoinBuySell(
        //               coinName: 'Nano',
        //               gradientColor: Colors.blue,
        //               coinImage: Image.asset('lib/assets/nano_.png')),
        //           CoinBuySell(
        //               coinName: 'DogeCoin',
        //               gradientColor: Colors.deepPurple,
        //               coinImage: Image.asset('lib/assets/dogecoin.png')),
        //           CoinBuySell(
        //               coinName: 'Tron',
        //               gradientColor: Colors.red,
        //               coinImage: Image.asset('lib/assets/tron_.png')),
        //           CoinBuySell(
        //               coinName: 'XRP',
        //               gradientColor: Colors.blue,
        //               coinImage: Image.asset('lib/assets/xrp.png')),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        // rwuwrohg
           // color Colors.amber,
              // child: PageView(
              //   controller: _cardController,
              //   scrollDirection: Axis.horizontal,
              //   children: [
              //     CardDetails(
              //       cardColor: Colors.deepOrange,
              //       cardBalance: 455656.00,
              //       cardNumber: 2355,
              //       cardExpiryMonth: 23,
              //       cardExpiryYear: 20,
              //       cardImage: Image.asset('lib/assets/bitcoin_cash.png'),
              //     ),
              //     CardDetails(
              //       cardColor: const Color.fromARGB(255, 112, 107, 106),
              //       cardBalance: 455656.00,
              //       cardNumber: 2355,
              //       cardExpiryMonth: 23,
              //       cardExpiryYear: 20,
              //       cardImage: Image.asset('lib/assets/litcoin_.png'),
              //     ),
              //     CardDetails(
              //       cardColor: Colors.blue,
              //       cardBalance: 455656.00,
              //       cardNumber: 2355,
              //       cardExpiryMonth: 23,
              //       cardExpiryYear: 20,
              //       cardImage: Image.asset('lib/assets/cardano.png'),
              //     ),
              //   ],
              // ),
              // weyfgw
               // const SizedBox(
            //   height: 20,
            // ),
            // SmoothPageIndicator(
            //   controller: _cardController,
            //   count: 3,
            //   effect: const ExpandingDotsEffect(
            //       dotColor: Colors.white,
            //       activeDotColor: Colors.deepOrange,
            //       dotHeight: 10),
            // ),

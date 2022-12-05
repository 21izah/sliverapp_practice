// ignore_for_file: unused_import, unused_field

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sliverapp_practice/backend_page_operations/crud_testing.dart';
import 'package:sliverapp_practice/containers/bitcoin_buy_sell_container.dart';
import 'package:sliverapp_practice/containers/busd_bep20_buy_sell_conatainer.dart';
import 'package:sliverapp_practice/containers/card_details.dart';
import 'package:sliverapp_practice/containers/coinBuySell.dart';
import 'package:sliverapp_practice/containers/coinContainer.dart';
import 'package:sliverapp_practice/containers/ethereum_buy_sell_container.dart';
import 'package:sliverapp_practice/containers/neuCoinContainer.dart';
import 'package:sliverapp_practice/containers/usdt_bep20_buy_sell_container.dart';
import 'package:sliverapp_practice/containers/usdt_trc20_buy_sell_container.dart';
import 'package:sliverapp_practice/containers/vertial%20containers/ver_bitcoin.dart';
import 'package:sliverapp_practice/containers/vertial%20containers/ver_busd_bep20.dart';
import 'package:sliverapp_practice/containers/vertial%20containers/ver_ethereum.dart';
import 'package:sliverapp_practice/containers/vertial%20containers/ver_usdt_bep20.dart';
import 'package:sliverapp_practice/containers/vertial%20containers/ver_usdt_trc20.dart';
import 'package:sliverapp_practice/pages/bitcoin_buy_page.dart';
import 'package:sliverapp_practice/pages/buy_page.dart';
import 'package:sliverapp_practice/pages/curved_navigation_bar_widget.dart';
import 'package:sliverapp_practice/pages/customer_care_page.dart';
import 'package:sliverapp_practice/pages/eigth_page.dart';
import 'package:sliverapp_practice/pages/liquid_swipe.dart';
import 'package:sliverapp_practice/pages/sell_page.dart';
import 'package:sliverapp_practice/widgets/bottom_navigation_bar.dart';
import 'package:sliverapp_practice/widgets/navigation_drawer_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _cardController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        splashColor: Colors.amber,
        elevation: 50,
        child: const Icon(Icons.message),
        onPressed: () {},
      ),
      drawer: const NavigationDrawerWidget(),
      backgroundColor: Colors.deepOrange.shade900,
      appBar: AppBar(backgroundColor: Colors.black),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                decoration: const BoxDecoration(
                    //  color: Colors.grey[900],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                height: 300,
                child: CardDetails(
                  cardColor: Colors.deepOrange,
                  cardBalance: 455656.00,
                  cardNumber: 2355,
                  cardExpiryMonth: 23,
                  cardExpiryYear: 20,
                  cardImage:
                      Lottie.asset('lib/assets/bitcoin.json', fit: BoxFit.fill),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CoinContainer(
                        coinImage: Lottie.asset('lib/assets/bitcoin.json'),
                        coinName: 'Bitcoin Cash'),
                    CoinContainer(
                        coinImage: Lottie.asset('lib/assets/litecoin.json'),
                        coinName: 'Litcoin'),
                    CoinContainer(
                        coinImage: Lottie.asset(
                            'lib/assets/cardano-ada-animation.json'),
                        coinName: 'Cardano'),
                    CoinContainer(
                        coinImage: Lottie.asset('lib/assets/dash.json'),
                        coinName: 'Dash'),
                    CoinContainer(
                        coinImage:
                            Lottie.asset('lib/assets/100440-monero.json'),
                        coinName: 'Monero'),
                    CoinContainer(
                        coinImage: Lottie.asset('lib/assets/dash.json'),
                        coinName: 'Digibite'),
                    CoinContainer(
                        coinImage: Lottie.asset(
                            'lib/assets/115452-bitcoin-dollar-exchange.json'),
                        coinName: 'Nano'),
                    CoinContainer(
                        coinImage:
                            Lottie.asset('lib/assets/100695-dogecoin.json'),
                        coinName: 'Dogecoin'),
                    CoinContainer(
                        coinImage: Lottie.asset(
                            'lib/assets/tether-usdt-animation.json'),
                        coinName: 'Tron'),
                    CoinContainer(
                        coinImage: Lottie.asset(
                            'lib/assets/115452-bitcoin-dollar-exchange.json'),
                        coinName: 'Xrp'),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EighthPage(),
                    )),
                    child: NeuCoinCardContainer(
                      coinName: 'Bitcoin',
                      coinImage: Lottie.asset('lib/assets/bitcoin.json'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CrudTesting(),
                    )),
                    child: NeuCoinCardContainer(
                      coinName: 'Ethereum',
                      coinImage: Lottie.asset(
                        'lib/assets/ethereum.json',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LiquidSwipeTesting(),
                    )),
                    child: NeuCoinCardContainer(
                      coinName: 'USDT',
                      coinImage:
                          Lottie.asset('lib/assets/tether-usdt-animation.json'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BuyPage(),
                    )),
                    child: NeuCoinCardContainer(
                      coinName: 'BUSD',
                      coinImage: Image.asset('lib/assets/busd-unscreen.gif'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SellPage(),
                    )),
                    child: NeuCoinCardContainer(
                      coinName: 'Other Crypto',
                      coinImage: Lottie.asset(
                          'lib/assets/115452-bitcoin-dollar-exchange.json',
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 30, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                          heroTag: 'customer page button',
                          backgroundColor: Colors.deepOrange,
                          splashColor: Colors.amber,
                          child: const Icon(Icons.message),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CustomerCarePage(),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
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
        //   children: [
        //     SizedBox(
        //       height: 300,
        //       // color: Colors.amber,
        //       child: PageView(
        //         controller: _cardController,
        //         scrollDirection: Axis.horizontal,
        //         children: [
        //           const CardDetails(
        //             cardColor: Colors.deepOrange,
        //             cardBalance: 455656.00,
        //             cardNumber: 2355,
        //             cardExpiryMonth: 23,
        //             cardExpiryYear: 20,
        //           ),
        //           const CardDetails(
        //             cardColor: Colors.green,
        //             cardBalance: 455656.00,
        //             cardNumber: 2355,
        //             cardExpiryMonth: 23,
        //             cardExpiryYear: 20,
        //           ),
        //           const CardDetails(
        //             cardColor: Colors.blue,
        //             cardBalance: 455656.00,
        //             cardNumber: 2355,
        //             cardExpiryMonth: 23,
        //             cardExpiryYear: 20,
        //           ),
        //         ],
        //       ),
        //     ),
        //     const SizedBox(
        //       height: 9,
        //     ),
        //     SmoothPageIndicator(
        //       controller: _cardController,
        //       count: 3,
        //       effect: const ExpandingDotsEffect(
        //           activeDotColor: Colors.deepOrange, dotHeight: 10),
        //     ),
        //     const SizedBox(
        //       height: 15,
        //     ),
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

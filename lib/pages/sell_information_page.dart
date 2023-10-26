import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';

import '../constants/data_constant.dart';

import '../widgets/popup_menu_button.dart';

import 'package:clipboard/clipboard.dart';

import 'welcomesixth_page.dart';

class SellInformationPage extends StatefulWidget {
  final String youGetAmount;
  final String youGetNairaAmount;

  const SellInformationPage({
    super.key,
    required this.youGetAmount,
    required this.youGetNairaAmount,
  });

  @override
  State<SellInformationPage> createState() => _SellInformationPageState();
}

class _SellInformationPageState extends State<SellInformationPage> {
  Future showMessage(String message) async {
    Get.bottomSheet(
      Container(
        height: 400,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 20,
            // ),
            Container(
              height: 200,
              width: double.maxFinite,
              child: Image.asset(
                'lib/assets/success.png',
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    Future.delayed(Duration(seconds: 2), () {
      Get.back();
      Get.off(() => SixthPage());
    });
  }

  Future showAccountMessage(String message) async {
    Get.bottomSheet(
      Container(
        height: 400,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 20,
            // ),
            Container(
              height: 200,
              width: double.maxFinite,
              child: Image.asset(
                'lib/assets/success.png',
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    Future.delayed(Duration(seconds: 2), () {
      Get.back();
    });
  }

  bool _buttonDisabled = false;
  Future _handleRefresh() async {
    return Future.delayed(const Duration(seconds: 2));
  }

  final _accountNumberController = TextEditingController();
  final _nameOnBankAccountController = TextEditingController();
  final _bankNameController = TextEditingController();

  @override
  void dispose() {
    _accountNumberController.dispose();
    _nameOnBankAccountController.dispose();
    _bankNameController.dispose();

    super.dispose();
  }

  int selectedIndex = 0;
  final _username = Hive.box('username');

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: const [
          PopUpMenuButtonWidget(),
        ],
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
      ),
      backgroundColor: primaryColor,
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Stack(
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: screenSize.height * 0.2,
                    decoration: BoxDecoration(
                      color: primaryColor,
                    ),
                  ),
                  Container(
                    height: screenSize.height * 0.65,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10,
                          // top: 10,
                          bottom: 10,
                        ),
                        child: ValueListenableBuilder(
                          valueListenable: _username.listenable(),
                          builder: (context, value, child) =>
                              LiquidPullToRefresh(
                            onRefresh: _handleRefresh,
                            color: Colors.grey[900],
                            animSpeedFactor: 2,
                            backgroundColor: Colors.deepOrange,
                            showChildOpacityTransition: false,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: screenSize.height * 0.055,
                                      decoration: BoxDecoration(
                                          color: Colors.deepOrange,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.all(10),
                                      margin: const EdgeInsets.all(5),
                                      child: const Text(
                                        'Account Number',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: screenSize.height * 0.055,
                                      width: screenSize.width - 158,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[200],
                                      ),
                                      margin:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        '098913323341',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: screenSize.height * 0.055,
                                      decoration: BoxDecoration(
                                          color: Colors.deepOrange,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.all(10),
                                      margin: const EdgeInsets.all(5),
                                      child: const Text(
                                        'Name on Bank Account',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: screenSize.height * 0.055,
                                      width: screenSize.width - 195,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[200],
                                      ),
                                      margin:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      padding: EdgeInsets.all(20),
                                      child: Text(
                                        'Izah Michael',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: screenSize.height * 0.055,
                                      decoration: BoxDecoration(
                                          color: Colors.deepOrange,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.all(10),
                                      margin: const EdgeInsets.all(5),
                                      child: const Text(
                                        'Bank Name',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: screenSize.height * 0.055,
                                      width: screenSize.width - 128,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[200],
                                      ),
                                      margin:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      padding: EdgeInsets.all(20),
                                      child: Text(
                                        'Zenith Bank',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: screenSize.height * 0.055,
                                      decoration: BoxDecoration(
                                          color: Colors.deepOrange,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.all(10),
                                      margin: const EdgeInsets.all(5),
                                      child: const Text(
                                        'Amount',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: screenSize.height * 0.055,
                                      width: screenSize.width - 107,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[200],
                                      ),
                                      margin:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      padding: EdgeInsets.all(20),
                                      child: Text(
                                        widget.youGetAmount,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [],
                                ),
                                Builder(builder: (context) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: screenSize.height * 0.055,
                                        decoration: BoxDecoration(
                                            color: Colors.deepOrange,
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(5),
                                        child: const Text(
                                          'Pay to',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: screenSize.height * 0.055,
                                        width: screenSize.width * 0.6,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[200],
                                        ),
                                        margin: const EdgeInsets.fromLTRB(
                                            5, 5, 5, 0),
                                        padding: EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '1K4uckMRTMCZSPqtrqcLEVQDtq1bBWYX68',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    screenSize.width * 0.023,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.bottomSheet(
                                                  Container(
                                                    height: 400,
                                                    decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        20))),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        // SizedBox(
                                                        //   height: 20,
                                                        // ),
                                                        Container(
                                                          height: 200,
                                                          width:
                                                              double.maxFinite,
                                                          child: Image.asset(
                                                            'lib/assets/b_btc_address.jpg',
                                                            fit: BoxFit
                                                                .scaleDown,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Text(
                                                            'Deposit ${widget.youGetAmount} BTC',
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height:
                                                    screenSize.height * 0.085,
                                                width: screenSize.width * 0.055,
                                                child: Image.asset(
                                                    'lib/assets/qr-code(1).png'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        // when clicked show copied to clipboard
                                        // 1 - cllick
                                        // 2 - show copied to clipboard
                                        onTap: () {
                                          showAccountMessage(
                                              'Account Number Copied To clipboard');
                                        },

                                        //  _buttonDisabled
                                        //     ? null
                                        //     : () async {
                                        //         setState(() {
                                        //           _buttonDisabled = true;
                                        //         });
                                        //         await FlutterClipboard.copy(
                                        //             '1K4uckMRTMCZSPqtrqcLEVQDtq1bBWYX68');

                                        //         AnimatedSnackBar(
                                        //           mobileSnackBarPosition:
                                        //               MobileSnackBarPosition
                                        //                   .top,
                                        //           builder: ((context) {
                                        //             return Container(
                                        //               decoration: BoxDecoration(
                                        //                 color: Colors.green,
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(10),
                                        //               ),
                                        //               padding:
                                        //                   const EdgeInsets.all(
                                        //                       8),
                                        //               // color: Colors.green,
                                        //               height:
                                        //                   screenSize.height *
                                        //                       0.05,

                                        //               width:
                                        //                   screenSize.width - 70,
                                        //               child: Center(
                                        //                 child: Text(
                                        //                   'Account Number Copied To clipboard',
                                        //                   style: TextStyle(
                                        //                       color:
                                        //                           Colors.white,
                                        //                       fontSize: screenSize
                                        //                               .width *
                                        //                           0.03),
                                        //                 ),
                                        //               ),
                                        //             );
                                        //           }),
                                        //         ).show(context);
                                        //       },
                                        child: Container(
                                            height: screenSize.height * 0.055,
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.deepOrange,
                                            ),
                                            margin: const EdgeInsets.fromLTRB(
                                                5, 5, 5, 5),
                                            child: Icon(Icons.copy_rounded)),
                                      ),
                                    ],
                                  );
                                }),
                                Builder(
                                  builder: (context) {
                                    final GlobalKey<SlideActionState> _key =
                                        GlobalKey();
                                    return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SlideAction(
                                        sliderButtonIconPadding: 10,
                                        sliderButtonIconSize: 10,
                                        outerColor: Colors.deepOrange,
                                        // innerColor: Colors.deepOrange,
                                        borderRadius: 20,
                                        height: screenSize.height * 0.07,
                                        key: _key,
                                        onSubmit: () {
                                          showMessage('Transaction successful');
                                        },
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'Swipe to comfirm',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        sliderButtonIcon: Icon(Icons.check),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.all(20.0),
                      //   child: Center(
                      //     child: SlideAction(
                      //       sliderButtonIconSize: 10,
                      //       height: 55,
                      //       borderRadius: 10,
                      //       outerColor: Colors.deepOrange,
                      //       innerColor: Colors.black,
                      //       text: 'Slide To Comfirm Transaction',
                      //       textStyle: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 17,
                      //           fontWeight: FontWeight.bold),
                      //       sliderRotate: false,
                      //       onSubmit: () {
                      //         showModalBottomSheet(
                      //           context: context,
                      //           builder: (context) {
                      //             return Container(
                      //               height: 400,
                      //               decoration: const BoxDecoration(
                      //                   color: Colors.white,
                      //                   borderRadius: BorderRadius.vertical(
                      //                       top: Radius.circular(20))),
                      //               child: Column(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.center,
                      //                   children: [
                      //                     // SizedBox(
                      //                     //   height: 20,
                      //                     // ),
                      //                     Container(
                      //                       height: 200,
                      //                       width: 200,
                      //                       child: Image.asset(
                      //                         'lib/assets/success.png',
                      //                         fit: BoxFit.scaleDown,
                      //                       ),
                      //                     ),
                      //                     const SizedBox(
                      //                       height: 10,
                      //                     ),
                      //                     const Text(
                      //                       'More Cashout Investor!',
                      //                       style: TextStyle(
                      //                           fontSize: 25,
                      //                           fontWeight: FontWeight.bold),
                      //                     ),
                      //                   ]),
                      //             );
                      //           },
                      //         );
                      //         Future.delayed(Duration(seconds: 2), () {
                      //           Navigator.pop(context);
                      //           Navigator.of(context).push(
                      //             MaterialPageRoute(
                      //               builder: (context) => const TabBarWidget(),
                      //             ),
                      //           );
                      //         });
                      //       },
                      //     ),
                      //   ),
                      // )

                      // const SizedBox(
                      //   height: 90,
                      // ),
                    ]),
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

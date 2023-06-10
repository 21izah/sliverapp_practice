import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../constants/data_constant.dart';

import '../widgets/popup_menu_button.dart';

import 'package:clipboard/clipboard.dart';

class SellInformationPage extends StatefulWidget {
  const SellInformationPage({super.key});

  @override
  State<SellInformationPage> createState() => _SellInformationPageState();
}

class _SellInformationPageState extends State<SellInformationPage> {
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
      body: SingleChildScrollView(
        child: Stack(
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
                  height: screenSize.height * 0.8,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
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
                        builder: (context, value, child) => LiquidPullToRefresh(
                          onRefresh: _handleRefresh,
                          color: Colors.grey[900],
                          animSpeedFactor: 2,
                          backgroundColor: Colors.deepOrange,
                          showChildOpacityTransition: false,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: const Text(
                                        'Account Number',
                                        style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: screenSize.width - 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[200],
                                      ),
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 5, 20, 5),
                                      padding: EdgeInsets.all(20),
                                      child: Text(
                                        '098913323341',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: const Text(
                                        'Name on Bank Account',
                                        style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: screenSize.width - 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[200],
                                      ),
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 5, 20, 5),
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
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: const Text(
                                        'Bank Name',
                                        style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: screenSize.width - 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[200],
                                      ),
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 10, 20, 10),
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
                                      margin: const EdgeInsets.only(left: 20),
                                      child: const Text(
                                        'Amount',
                                        style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: screenSize.width - 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[200],
                                      ),
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 10, 20, 10),
                                      padding: EdgeInsets.all(20),
                                      child: Text(
                                        '3.45532BTC',
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
                                      margin: const EdgeInsets.only(left: 20),
                                      child: const Text(
                                        'Pay to',
                                        style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Builder(builder: (context) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: screenSize.height * 0.07,
                                        width: screenSize.width - 130,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[200],
                                        ),
                                        margin: const EdgeInsets.fromLTRB(
                                            20, 5, 5, 5),
                                        padding: EdgeInsets.all(20),
                                        child: Text(
                                          '1K4uckMRTMCZSPqtrqcLEVQDtq1bBWYX68',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: screenSize.width * 0.03,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        // when clicked show copied to clipboard
                                        // 1 - cllick
                                        // 2 - show copied to clipboard
                                        onTap: _buttonDisabled
                                            ? null
                                            : () async {
                                                setState(() {
                                                  _buttonDisabled = true;
                                                });
                                                await FlutterClipboard.copy(
                                                    '1K4uckMRTMCZSPqtrqcLEVQDtq1bBWYX68');

                                                AnimatedSnackBar(
                                                  mobileSnackBarPosition:
                                                      MobileSnackBarPosition
                                                          .top,
                                                  builder: ((context) {
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      // color: Colors.green,
                                                      height:
                                                          screenSize.height *
                                                              0.05,

                                                      width:
                                                          screenSize.width - 70,
                                                      child: Center(
                                                        child: Text(
                                                          'Account Number Copied To clipboard',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: screenSize
                                                                      .width *
                                                                  0.03),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                ).show(context);
                                              },
                                        child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.deepOrange,
                                            ),
                                            margin: const EdgeInsets.fromLTRB(
                                                20, 5, 20, 5),
                                            child: Icon(Icons.copy_rounded)),
                                      ),
                                    ],
                                  );
                                }),
                              ],
                            ),
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
      ),
    );
  }
}

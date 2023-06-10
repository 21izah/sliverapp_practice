// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:page_transition/page_transition.dart';
import '../constants/data_constant.dart';

import '../widgets/popup_menu_button.dart';
import 'sell_information_page.dart';

class AccountRequirementPage extends StatefulWidget {
  const AccountRequirementPage({super.key});

  @override
  State<AccountRequirementPage> createState() => _AccountRequirementPageState();
}

class _AccountRequirementPageState extends State<AccountRequirementPage> {
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
    final orientation = MediaQuery.of(context).orientation;
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final systemPadding = MediaQuery.of(context).padding;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
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
        child: Stack(children: [
          Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenSize.height * 0.2,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                  ),
                ),
                // child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center, children: []),
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
                                height: 70,
                              ),
                              const SizedBox(
                                height: 10,
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
                              Container(
                                margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: TextFormField(
                                  cursorColor: primaryColor,
                                  keyboardType: TextInputType.number,
                                  controller: _accountNumberController,
                                  decoration: InputDecoration(
                                      hintText: 'Account Number',
                                      hintStyle: TextStyle(color: primaryColor),
                                      filled: true,
                                      fillColor:
                                          Theme.of(context).colorScheme.primary,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
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
                              Container(
                                margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: TextFormField(
                                  cursorColor: primaryColor,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _nameOnBankAccountController,
                                  decoration: InputDecoration(
                                      hintText: 'Name on Bank Account',
                                      hintStyle: TextStyle(color: primaryColor),
                                      filled: true,
                                      fillColor:
                                          Theme.of(context).colorScheme.primary,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
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
                              Container(
                                margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: TextFormField(
                                  cursorColor: primaryColor,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _bankNameController,
                                  decoration: InputDecoration(
                                      hintText: 'Bank Name',
                                      hintStyle: TextStyle(color: primaryColor),
                                      filled: true,
                                      fillColor:
                                          Theme.of(context).colorScheme.primary,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageTransition(
                                child: SellInformationPage(),
                                type: PageTransitionType.rightToLeft,
                              ),
                            );
                          },
                          child: Center(
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),

                  // const SizedBox(
                  //   height: 90,
                  // ),
                ]),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

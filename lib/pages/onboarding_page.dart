// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, use_build_context_synchronously, depend_on_referenced_packages, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliverapp_practice/riverpod_practice/dropdown_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:lottie/lottie.dart';

import 'login_selection.dart';
import '../constants/data_constant.dart';
import 'sign_up_page copy.dart';
import 'sign_up_page.dart';
import '../riverpod_practice/change_onboarding_screen.dart';

class OnboardingPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  bool isLastPage = false;
  final List items = [
    'Airtel',
    'MTN',
    'GLO',
    '9Mobile',
  ];

  //
  dynamic _selectedValue = 'Airtel';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorChangeModel colorModel = Provider.of<ColorChangeModel>(context);
    final dropdownStateProvider = Provider.of<DropdownStateProvider>(context);
    final selectedValue = dropdownStateProvider.selectedValue;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: ((index) {
            setState(() {
              isLastPage = index == 4;
              colorModel.updateSwipePosition(index.toDouble());
            });
          }),
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Colors.deepOrange.shade500,
                  ],
                  stops: const [0.01, 0.9],
                ),
                // color: Colors.black,
              ),
              // color: colorModel.interpolatedColor,
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Select Language',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: DropdownButton(
                              underline: Container(),
                              dropdownColor:
                                  Theme.of(context).colorScheme.tertiary,
                              borderRadius: BorderRadius.circular(10),
                              items: [
                                DropdownMenuItem(
                                  value: 'Airtel',
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 10,
                                          child: Image.asset(
                                              'lib/assets/united_kingdom.jpeg'),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'EN',
                                        style: TextStyle(
                                          color: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'MTN',
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 10,
                                          child: Image.asset(
                                              'lib/assets/germany_flag.jpeg'),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'DE',
                                        style: TextStyle(
                                          color: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'GLO',
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 10,
                                          child: Image.asset(
                                              'lib/assets/china_flag.png'),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'ZH',
                                        style: TextStyle(
                                          color: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: '9Mobile',
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 10,
                                          child: Image.asset(
                                              'lib/assets/spain_flag.jpeg'),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'ES',
                                        style: TextStyle(
                                          color: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              value: selectedValue,
                              onChanged: (newvalue) async {
                                await dropdownStateProvider
                                    .saveSelectedvalue(newvalue);
                                dropdownStateProvider
                                    .toggleDropdowmnScheme(newvalue);
                              },
                            ),
                          ),
                        ),
                        // DropDownButton2(),
                      ],
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),

                      // color: Colors.deepOrange,
                      height: 400,
                      width: 400,
                      // color: Colors.blue,

                      // width: double.infinity,
                      child:
                          Lottie.asset('lib/assets/86719-cryptocurrency.json'),
                    ),
                    // AspectRatio(
                    //   aspectRatio: 80 / 5,
                    //   child:
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(
                          'welcome to cza exchange'.tr,
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Colors.deepOrange.shade500,
                  ],
                  stops: const [0.01, 0.9],
                ),
                // color: Colors.black,
              ),
              // color: colorModel.interpolatedColor,
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 400,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child:

                          //  Image.asset(
                          //   'lib/assets/Data_security.png',
                          //   fit: BoxFit.fill,
                          // ),
                          Lottie.asset('lib/assets/114272-security.json'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Text(
                        'high level security'.tr,
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),

              // child: Image.asset('lib/assets/fast_payment.png'),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Colors.deepOrange.shade600,
                  ],
                  stops: const [0.01, 0.9],
                ),
                // color: Colors.black,
              ),
              // color: colorModel.interpolatedColor,
              //   child: AspectRatio(
              //    aspectRatio: 1 / 1,
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      height: 400,
                      width: 400,
                      child: Lottie.asset(
                          'lib/assets/110046-transaction-success.json'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30, bottom: 10),
                      child: Text(
                        'seemless transactions'.tr,
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Center(
                    //   child: Text(
                    //     'Get Paid with easy to no stress',
                    //     style: TextStyle(
                    //       color: blackColor,
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            // child: Image.asset('lib/assets/fast_payment.png'),
            //   ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Colors.deepOrange.shade700,
                  ],
                  stops: const [0.01, 0.9],
                ),
                // color: Colors.black,
              ),
              // color: colorModel.interpolatedColor,

              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      height: 400,
                      width: 400,
                      child: Lottie.asset('lib/assets/77096-service.json'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: Text(
                        '24/7 customer care service'.tr,
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    )
                  ],
                ),
              ),

              // child: Image.asset('lib/assets/fast_payment.png'),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    colorModel.interpolatedColor,
                  ],
                  stops: const [0.01, 0.9],
                ),
                // color: Colors.black,
              ),
              // color: colorModel.interpolatedColor,
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 500,
                      width: 500,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      // width: double.infinity,
                      child:
                          Lottie.asset('lib/assets/92445-crypto-bitcoin.json'),
                    ),
                    Text(
                      'instant payment'.tr,
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    // Text(
                    //   '',
                    //   style: TextStyle(
                    //     color: blackColor,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),

              // child: Image.asset('lib/assets/fast_payment.png'),
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              decoration: BoxDecoration(
                color: colorModel.interpolatedColor,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: colorModel.interpolatedColor,
                    minimumSize: const Size.fromHeight(60)),
                onPressed: () async {
                  final pref = await SharedPreferences.getInstance();
                  pref.setBool('showHome', true);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignUPpage2(),
                    ),
                  );
                },
                child: Text(
                  'GET STARTED'.tr,
                  style: TextStyle(
                    color: whiteColor,
                  ),
                ),
              ),
            )
          : Container(
              color: colorModel.interpolatedColor,
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          controller.jumpToPage(5);
                        },
                        child: Container(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              color: colorModel.interpolatedColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'SKIP'.tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 5,
                        effect: WormEffect(
                            dotWidth: 5,
                            dotHeight: 5,
                            spacing: 7,
                            dotColor: Theme.of(context).colorScheme.tertiary,
                            activeDotColor:
                                Theme.of(context).colorScheme.background),
                        onDotClicked: (index) {
                          controller.animateToPage(index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.bounceInOut);
                        },
                        child: Container(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              color: colorModel.interpolatedColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'NEXT'.tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))),
                  ]),
            ),
    );
  }
}

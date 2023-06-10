// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// ignore: unused_import
import 'package:lottie/lottie.dart';

import 'login_selection.dart';
import '../constants/data_constant.dart';
import 'sign_up_page copy.dart';
import 'sign_up_page.dart';

class OnboardingPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: ((index) {
            setState(() {
              isLastPage = index == 4;
            });
          }),
          children: [
            Container(
              color: whiteColor,
              //  child: AspectRatio(
              //   aspectRatio: 300 / 5,
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          'WELCOME TO CZA EXCHANGE',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Hi there! Welcome to the Cza Family!',
                              style: TextStyle(color: blackColor),
                            ),
                            Text(
                              'We are glad  to help you earn and grow your business.',
                              style: TextStyle(color: blackColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
            ),

            Container(
              color: whiteColor,
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
                        'SECURITY',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 2,
                    // ),

                    Container(
                      margin: const EdgeInsets.only(
                        left: 50,
                        top: 10,
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'As a reputable company your SECURITY ',
                              style: TextStyle(color: blackColor),
                            ),
                            Text(
                              'is our ulmost priority',
                              style: TextStyle(color: blackColor),
                            ),
                          ],
                        ),
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
              color: whiteColor,
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
                        'TRANSACTION SUCCESSFULL',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Get Paid with easy to no stress',
                        style: TextStyle(
                          color: blackColor,
                        ),
                      ),
                    ),
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
              color: whiteColor,

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
                        '24/7 CUSTOMER CARE SERVICE',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30, top: 10),
                      child: Column(
                        children: [
                          Text(
                            'With our 24hours, 7days a week service,',
                            style: TextStyle(color: blackColor),
                          ),
                          Text(
                            ' we are always accessible to meet your needs',
                            style: TextStyle(color: blackColor),
                          ),
                        ],
                      ),

                      //  Text(
                      //   'With our 24hours, 7days a week service, \n we are always accessible to meet your needs ',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //   ),
                      // ),
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
              color: whiteColor,
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
                      'FAST PAYMENT',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Receive Payment in no distant time',
                      style: TextStyle(
                        color: blackColor,
                      ),
                    ),
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
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              decoration: BoxDecoration(
                color: whiteColor,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                    minimumSize: const Size.fromHeight(80)),
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
                  'GET STARTED',
                  style: TextStyle(color: primaryColor),
                ),
              ),
            )
          : Container(
              color: whiteColor,
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
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'SKIP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))),
                    Center(
                        child: SmoothPageIndicator(
                      controller: controller,
                      count: 5,
                      effect: WormEffect(
                          dotWidth: 13,
                          dotHeight: 15,
                          spacing: 7,
                          dotColor: blackColor,
                          activeDotColor: primaryColor),
                      onDotClicked: (index) {
                        controller.animateToPage(index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                    )),
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
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'NEXT',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))),
                  ]),
            ),
    );
  }
}

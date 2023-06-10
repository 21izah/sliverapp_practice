import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class FundAccountPage extends StatefulWidget {
  const FundAccountPage({super.key});

  @override
  State<FundAccountPage> createState() => _FundAccountPageState();
}

class _FundAccountPageState extends State<FundAccountPage> {
  bool _buttonDisabled = false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Scrollbar(
        interactive: true,
        child: ListView(children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.all(20),
              height: 120,
              width: screenSize.width,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              child: Row(children: [
                CircleAvatar(
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fund Wallet',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Transfer to any of the account number below',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'to fund your wallet',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
              top: 5,
              bottom: 20,
            ),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(20)),
              height: 200,
              width: screenSize.width,
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(
                      'Opay',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: screenSize.width * 0.35,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 171, 50, 13)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '9064139951  ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                GestureDetector(
                                    onTap: _buttonDisabled
                                        ? null
                                        : () async {
                                            setState(() {
                                              _buttonDisabled = true;
                                            });

                                            await FlutterClipboard.copy(
                                                '9064139951');

                                            AnimatedSnackBar(
                                              mobileSnackBarPosition:
                                                  MobileSnackBarPosition.top,
                                              builder: ((context) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  // color: Colors.green,
                                                  height:
                                                      screenSize.height * 0.10,

                                                  width: screenSize.width - 70,
                                                  child: Container(
                                                    child: Center(
                                                      child: const Text(
                                                        'Opay Account Number Copied To clipboard',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ).show(context);
                                          },
                                    child: Icon(Icons.copy_rounded)),
                              ]),
                        ),
                        Text(
                          'Onwuka Michael Ogbolu',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
              top: 5,
              bottom: 20,
            ),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              height: 200,
              width: screenSize.width,
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(
                      '9 Payment Service Bank',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: screenSize.width * 0.35,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 14, 67, 109)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '6074930296  ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                GestureDetector(
                                    onTap: _buttonDisabled
                                        ? null
                                        : () async {
                                            setState(() {
                                              _buttonDisabled = true;
                                            });

                                            await FlutterClipboard.copy(
                                                '6074930296');

                                            AnimatedSnackBar(
                                              mobileSnackBarPosition:
                                                  MobileSnackBarPosition.top,
                                              builder: ((context) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  // color: Colors.green,
                                                  height:
                                                      screenSize.height * 0.10,

                                                  width: screenSize.width - 70,
                                                  child: Container(
                                                    child: Center(
                                                      child: const Text(
                                                        '9 Payment Service Bank Account Number Copied To clipboard',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ).show(context);
                                          },
                                    child: Icon(Icons.copy_rounded)),
                              ]),
                        ),
                        Text(
                          'Onwuka Michael Ogbolu',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
              top: 5,
              bottom: 20,
            ),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20)),
              height: 200,
              width: screenSize.width,
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(
                      'Kuda Bank',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: screenSize.width * 0.35,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepPurple),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '2000571368  ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                GestureDetector(
                                    onTap: _buttonDisabled
                                        ? null
                                        : () async {
                                            setState(() {
                                              _buttonDisabled = true;
                                            });

                                            await FlutterClipboard.copy(
                                                '2000571368');

                                            AnimatedSnackBar(
                                              mobileSnackBarPosition:
                                                  MobileSnackBarPosition.top,
                                              builder: ((context) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  // color: Colors.green,
                                                  height:
                                                      screenSize.height * 0.10,

                                                  width: screenSize.width - 70,
                                                  child: Container(
                                                    child: Center(
                                                      child: const Text(
                                                        'Kuda Account Number Copied To clipboard',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ).show(context);
                                          },
                                    child: Icon(Icons.copy_rounded)),
                              ]),
                        ),
                        Text(
                          'Onwuka Michael Ogbolu',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
              top: 5,
              bottom: 20,
            ),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              height: 200,
              width: screenSize.width,
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(
                      'Wema Bank',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: screenSize.width * 0.35,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.greenAccent),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '8540692307  ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                GestureDetector(
                                    onTap: _buttonDisabled
                                        ? null
                                        : () async {
                                            setState(() {
                                              _buttonDisabled = true;
                                            });

                                            await FlutterClipboard.copy(
                                                '8540692307 ');

                                            AnimatedSnackBar(
                                              mobileSnackBarPosition:
                                                  MobileSnackBarPosition.top,
                                              builder: ((context) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  // color: Colors.green,
                                                  height:
                                                      screenSize.height * 0.10,

                                                  width: screenSize.width - 70,
                                                  child: Container(
                                                    child: Center(
                                                      child: const Text(
                                                        'Wema Account Number Copied To clipboard',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ).show(context);
                                          },
                                    child: Icon(Icons.copy_rounded)),
                              ]),
                        ),
                        Text(
                          'Onwuka Michael Ogbolu',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

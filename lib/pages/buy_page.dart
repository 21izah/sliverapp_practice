// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:sliverapp_practice/pages/help_page.dart';

class BuyPage extends StatefulWidget {
  BuyPage({Key? key}) : super(key: key);

  var buyRates = Hive.openBox('buyRates');

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 9,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.black26,
        ),
        body: LiquidPullToRefresh(
          onRefresh: _handleRefresh,
          color: Colors.grey[900],
          animSpeedFactor: 2,
          backgroundColor: Colors.deepOrange,
          showChildOpacityTransition: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.deepOrange,
                            blurRadius: 15,
                            offset: Offset(5, 5),
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 15,
                            offset: Offset(-5, -5),
                            spreadRadius: 1),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  child: const Text(
                    "BUY",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                IntrinsicWidth(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(width: 5),
                      Column(children: [
                        const Text(
                          "From",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrange),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.deepOrange,
                                      blurRadius: 15,
                                      offset: Offset(5, 5),
                                      spreadRadius: 1),
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 15,
                                      offset: Offset(-5, -5),
                                      spreadRadius: 1),
                                ],
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black),
                            child: const Text(
                              "Cza",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        // const SizedBox(
                        //   width: 120,
                        // ),
                      ]),
                      const SizedBox(
                        width: 170,
                      ),
                      Column(
                        children: [
                          const Text(
                            "To",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.deepOrange),
                          ),
                          const SizedBox(height: 20),
                          Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.deepOrange,
                                        blurRadius: 15,
                                        offset: Offset(5, 5),
                                        spreadRadius: 1),
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 15,
                                        offset: Offset(-5, -5),
                                        spreadRadius: 1),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black),
                              child: const Text(
                                "Wallet",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                          const SizedBox(width: 40),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.deepOrange,
                            blurRadius: 15,
                            offset: Offset(5, 5),
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 15,
                            offset: Offset(-5, -5),
                            spreadRadius: 1),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  child: const Text(
                    'Rate: \$750',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  ),
                ),

                // Container(
                //   padding: const EdgeInsets.all(15),
                //   decoration: BoxDecoration(
                //       boxShadow: const [
                //         BoxShadow(
                //             color: Colors.deepOrange,
                //             blurRadius: 15,
                //             offset: Offset(5, 5),
                //             spreadRadius: 1),
                //         BoxShadow(
                //             color: Colors.black,
                //             blurRadius: 15,
                //             offset: Offset(-5, -5),
                //             spreadRadius: 1),
                //       ],
                //       borderRadius: BorderRadius.circular(20),
                //       color: Colors.black),
                //   child: const Text(
                //     "Rate:\$700",
                //     style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.deepOrange),
                //   ),
                // ),

                // Container(
                //   padding: const EdgeInsets.all(15),
                //   decoration: BoxDecoration(
                //       boxShadow: const [
                //         BoxShadow(
                //             color: Colors.deepOrange,
                //             blurRadius: 15,
                //             offset: Offset(5, 5),
                //             spreadRadius: 1),
                //         BoxShadow(
                //             color: Colors.black,
                //             blurRadius: 15,
                //             offset: Offset(-5, -5),
                //             spreadRadius: 1),
                //       ],
                //       borderRadius: BorderRadius.circular(20),
                //       color: Colors.black),
                //   child: const Text(
                //     "Rate:\$700",
                //     style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.deepOrange),
                //   ),
                // ),
                const SizedBox(
                  height: 50,
                ),

                // const Divider(
                //   indent: 20,
                //   color: Colors.deepOrange,
                //   thickness: 5,
                //   endIndent: 20,
                // ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.deepOrange,
                            blurRadius: 15,
                            offset: Offset(5, 5),
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 15,
                            offset: Offset(-5, -5),
                            spreadRadius: 1),
                      ],
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    "You Pay",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Input Amount",
                        suffixText: "BTC",
                        hintText: 'Input Amount',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.2),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.deepOrange,
                            blurRadius: 15,
                            offset: Offset(5, 5),
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 15,
                            offset: Offset(-5, -5),
                            spreadRadius: 1),
                      ],
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    "You Pay",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        suffixText: "NGN",
                        hintText: 'Input Amount',
                        labelText: "Input Amount",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.2),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // const Divider(
                //   indent: 20,
                //   color: Colors.deepOrange,
                //   thickness: 5,
                //   endIndent: 20,
                // ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Wallet Address",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                // Container(

                //   // TextFormField(
                //   //   decoration: InputDecoration(
                //   //       //  prefixIcon: Icon(Icons.person),
                //   //       labelText: "Wallet Address",
                //   //       floatingLabelBehavior: FloatingLabelBehavior.auto,
                //   //       //   hintText: 'Username',
                //   //       filled: true,
                //   //       fillColor: Colors.white.withOpacity(0.2),
                //   //       border: OutlineInputBorder(
                //   //           borderSide: BorderSide.none,
                //   //           borderRadius: BorderRadius.circular(10))),
                //   // ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.deepOrange,
                            blurRadius: 15,
                            offset: Offset(5, 5),
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 15,
                            offset: Offset(-5, -5),
                            spreadRadius: 1),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HelpPage(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white),
                    child: const Text("Continue"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _handleRefresh() async {
    return Future.delayed(const Duration(seconds: 2));
  }
}

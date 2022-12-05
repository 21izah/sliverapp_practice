// ignore_for_file: unused_import, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:sliverapp_practice/pages/help_page.dart';
import 'package:sliverapp_practice/pages/stack_learning.dart';
import 'package:sliverapp_practice/pages/tab_bar.dart';
import 'package:sliverapp_practice/pages/welcomesixth_page.dart';

class SellPage extends StatefulWidget {
  const SellPage({Key? key}) : super(key: key);

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  Future _handleRefresh() async {
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black12,
      ),
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        color: Colors.grey[900],
        animSpeedFactor: 2,
        backgroundColor: Colors.black,
        showChildOpacityTransition: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: BoxDecoration(
                    color: Colors.black,
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
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "SELL",
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
                  children: [
                    //    const SizedBox(width: 5),
                    Column(children: [
                      const Text(
                        "From",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.deepOrange),
                      ),
                      const SizedBox(
                        height: 10,
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
                            "Wallet",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      const SizedBox(
                        width: 100,
                      ),
                    ]),
                    SizedBox(
                      width: 150,
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
                        const SizedBox(height: 10),
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
                              " Cza",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                padding: EdgeInsets.all(15),
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
                  "Rate:\$710",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // Divider(
              //   indent: 20,
              //   color: Colors.deepOrange,
              //   thickness: 5,
              //   endIndent: 20,
              // ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                  cursorColor: Colors.deepOrange,
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
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                  cursorColor: Colors.deepOrange,
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
              // Divider(
              //   indent: 20,
              //   color: Colors.deepOrange,
              //   thickness: 5,
              //   endIndent: 20,
              // ),
              const SizedBox(
                height: 50,
              ),

              Column(
                children: [
                  const Text(
                    "BTC Wallet Address",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.deepOrange),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: const SelectableText(
                      "1K4uckMRTMCZSPqtrqcLEVQDtq1bBWYX68",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 40,
              ),

              Column(
                children: [
                  const Text(
                    "ETH ERC-20 Wallet Address",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.deepOrange),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: const SelectableText(
                      "0x3811dc796459625dcb84245ef11afe0e493dc52e",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 40,
              ),

              Column(
                children: [
                  const Text(
                    "USDT TRC-20 Wallet Address",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.deepOrange),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: const SelectableText(
                      "TLYmRPbLnofarNsZ6iLvgmi7jZsECnnvMs",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 40,
              ),

              Column(
                children: [
                  const Text(
                    "USDT BEP-20 Wallet Address",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.deepOrange),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: const SelectableText(
                      "0x3811dc796459625dcb84245ef11afe0e493dc52e",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 40,
              ),

              Column(
                children: [
                  const Text(
                    "USDT ERC-20 Wallet Address",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.deepOrange),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: const SelectableText(
                      "0x3811dc796459625dcb84245ef11afe0e493dc52e",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 40,
              ),

              Column(
                children: [
                  const Text(
                    "USDT Polygon Wallet Address",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.deepOrange),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: const SelectableText(
                      "0x3811dc796459625dcb84245ef11afe0e493dc52e",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 40,
              ),

              Column(
                children: [
                  const Text(
                    "BUSD BEP-20 Wallet Address",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.deepOrange),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: const SelectableText(
                      "0x3811dc796459625dcb84245ef11afe0e493dc52e",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                    ),
                  ),
                ],
              ),
              // Container(
              //   margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //         //  prefixIcon: Icon(Icons.person),
              //         labelText: "Wallet Address",
              //         floatingLabelBehavior: FloatingLabelBehavior.auto,
              //         //   hintText: 'Username',
              //         filled: true,
              //         fillColor: Colors.white.withOpacity(0.2),
              //         border: OutlineInputBorder(
              //             borderSide: BorderSide.none,
              //             borderRadius: BorderRadius.circular(10))),
              //   ),
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
    );
  }
}

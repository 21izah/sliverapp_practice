// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BitcoinApi extends StatefulWidget {
  const BitcoinApi({super.key});

  @override
  State<BitcoinApi> createState() => _BitcoinApiState();
}

class _BitcoinApiState extends State<BitcoinApi> {
  // Function to fetch API data
  // Future<void> getData() async {

  //   // Make a HTTP GET request
  //   var response = await http.get(
  //       "https://jsonplaceholder.typicode.com/posts/1");

  //   // If the request was successful, parse the JSON data and create a Post object
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       post = Post.fromJson(json.decode(response.body));
  //     });
  //   } else {
  //     print("Request failed with status code: ${response.statusCode}");
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: []),
    );
  }
}

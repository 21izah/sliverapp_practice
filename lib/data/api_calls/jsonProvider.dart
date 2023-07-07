import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiProvider {
  final _username = Hive.box('username');
  Future getTeams() async {
    var url =
        'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    var jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
    print(jsonData);
    var jsonbit1 = jsonData['bitcoin']['usd'];
    await jsonbit1;

    await _username.put(14, jsonData['bitcoin']['usd']);
    print(jsonData['bitcoin']['usd']);
    print(_username.get(14).toString());

    if (response.statusCode == 200) {
      return jsonData;
    } else {
      throw Exception('Failed to load Api Data');
    }
  }

  Future getEthPrice() async {
    var url =
        'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Cethereum&vs_currencies=usd%2Cngn';
    var response = await http.get(Uri.parse(url));

    print(response.body);
    var jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
    print(jsonData);

    var jsonbit = jsonData['ethereum']['usd'];
    await jsonbit;

    _username.put(13, jsonbit);
    print(jsonData['ethereum']['usd']);
    print(_username.get(13).toString());

    if (response.statusCode == 200) {
      return jsonData;
    } else {
      throw Exception('Failed to load Api Data');
    }
  }

  Future postrequest() async {
    // API endPoint URL
    var url = Uri.parse(
        'http://restapi.adequateshop.com/api/authaccount/registration');

// Request body
    var requestBody = {
      'name': 'John Doe',
      'email': 'johndoe@example.com',
      'password': 123456,
    };

    // Encode requestBody as JSON or convert to JSON format

    var body2 = convert.jsonEncode(requestBody);
    print(body2);

    var headers = {
      'content-Type': 'application/json',
      // 'Authorization': 'Bearer ${token}'
    };

    // making post Request

    var response = await http.post(
      url,
      body: body2,
      headers: headers,
    );

    // checking response status

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseData = convert.jsonDecode(response.body);
      print(responseData);
      print('Request failed with status: ${response.statusCode}');
    }
  }
}

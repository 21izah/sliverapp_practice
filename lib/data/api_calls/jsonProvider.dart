import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:sliverapp_practice/model/chartModel.dart';
import 'dart:convert' as convert;

import 'package:sliverapp_practice/model/coinModel.dart';

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

  Future<List<CoinModel>> getCoinMarket() async {
    // var coinMarketList;
    var url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';
    var response = await http.get(Uri.parse(url), headers: {
      "content-Type": "application/json",
      "Accept": "application/json",
    });

    if (response.statusCode == 200) {
      // print(response.body);
      final body = response.body;

      final coinMarketList = coinModelFromJson(body);

      return coinMarketList;

      // CoinModel.fromJson(jsonData).name;
    } else {
      throw Exception('Failed to load Api Data');
    }
  }

  Future getChart(String coinId) async {
    // var coinMarketList;
    var url =
        'https://api.coingecko.com/api/v3/coins/${coinId}/ohlc?vs_currency=usd&days=1';
    var response = await http.get(Uri.parse(url), headers: {
      "content-Type": "application/json",
      "Accept": "application/json",
    });

    if (response.statusCode == 200) {
      Iterable x = convert.jsonDecode(response.body);
      List<ChartModel> modelList =
          x.map((e) => ChartModel.fromJson(e)).toList();

      return modelList;
      // print(response.body);
      // final body = response.body;

      // final coinMarketList = coinModelFromJson(body);
      // return coinMarketList;

      // CoinModel.fromJson(jsonData).name;
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
    var jsonbit1 = jsonData['ethereum']['ngn'];
    await jsonbit1;
    var jsonbit2 = jsonData['bitcoin']['ngn'];
    await jsonbit2;

    _username.put(13, jsonbit);
    _username.put(15, jsonbit1);
    _username.put(16, jsonbit2);
    print(jsonData['ethereum']['usd']);
    print(jsonData['ethereum']['ngn']);
    print(jsonData['bitcoin']['ngn']);
    print(_username.get(13).toString());

    if (response.statusCode == 200) {
      return jsonData;
    } else {
      throw Exception('Failed to load Api Data');
    }
  }

  Future getNgnPrice() async {
    var url =
        'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=ngn';
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
      print(Text('post request successful'));
      print('Request failed with status: ${response.statusCode}');
    }
  }
}

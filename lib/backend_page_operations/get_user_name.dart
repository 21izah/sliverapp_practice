import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiPractice extends StatefulWidget {
  const ApiPractice({super.key});

  @override
  State<ApiPractice> createState() => _ApiPracticeState();
}

class _ApiPracticeState extends State<ApiPractice> {
  final _username = Hive.box('username');
  Future getTeams() async {
    var url =
        'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    var jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
    print(jsonData);

    // ignore: unused_local_variable
    var jsonbit = jsonData['bitcoin']['usd'];

    _username.put(10, jsonData['bitcoin']['usd']);
    print(jsonData['bitcoin']['usd']);
    print(_username.get(10).toString());

    if (response.statusCode == 200) {
      return jsonData;
    } else {
      throw Exception('Failed to load Api Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getTeams(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                // child: Text('${snapshot.data}'),
                child: Text('bitcoin: ${_username.get(10).toString()}'),
                // child: Text('bitcoin: ${_username.get(10).toString()}'),
              );
            } else if (snapshot.hasError) {
              return Text('data');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

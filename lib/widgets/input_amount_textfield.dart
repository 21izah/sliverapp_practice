import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class InputAmountTextfield extends StatefulWidget {
  const InputAmountTextfield({super.key});

  @override
  State<InputAmountTextfield> createState() => _InputAmountTextfieldState();
}

class _InputAmountTextfieldState extends State<InputAmountTextfield> {
  Future getTeams() async {
    var url =
        'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    var jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
    print(jsonData);
    var jsonbit1 = jsonData['bitcoin']['usd'];
    await jsonbit1;

    _username.put(14, jsonData['bitcoin']['usd']);
    print(jsonData['bitcoin']['usd']);
    print(_username.get(14).toString());

    if (response.statusCode == 200) {
      return jsonData;
    } else {
      throw Exception('Failed to load Api Data');
    }
  }

  final _username = Hive.box('username');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _btcController = TextEditingController();
  final _nairaController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _btcController.dispose();
    _nairaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FutureBuilder(
          future: getTeams(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  double? number = double.tryParse(value);
                  if (number != null) {
                    _nairaController.text =
                        (number / _username.get(14)).toString();
                  } else {
                    _nairaController.text = '';
                  }
                },
                controller: _btcController,
                cursorColor: Colors.deepOrange,
                decoration: InputDecoration(
                    suffixText: "USD",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Input Amount In USD',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    )),
              );
            } else if (snapshot.hasError) {
              return Text('data');
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

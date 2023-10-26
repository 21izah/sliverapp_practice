import 'package:flutter/material.dart';

import '../constants/data_constant.dart';

class MakeAdminPage extends StatefulWidget {
  const MakeAdminPage({super.key});

  @override
  State<MakeAdminPage> createState() => _MakeAdminPageState();
}

class _MakeAdminPageState extends State<MakeAdminPage> {
  final _makeAdminController = TextEditingController();

  @override
  void dispose() {
    _makeAdminController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Make Admin Panel'),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: screenSize.height * 0.05,
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: TextFormField(
            style: TextStyle(color: primaryColor),
            cursorColor: primaryColor,
            keyboardType: TextInputType.number,
            controller: _makeAdminController,
            decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(
                    color: blackColor, fontSize: screenSize.width * 0.03),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.deepOrange),
          height: 50,
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Center(
              child: const Text(
            "Make Admin",
            style: TextStyle(color: Colors.white),
          )),
        ),
      ]),
    );
  }
}

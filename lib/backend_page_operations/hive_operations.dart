// ignore_for_file: unused_import, no_leading_underscores_for_local_identifiers, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sliverapp_practice/pages/sliver_app.dart';

class HiveOperations extends StatefulWidget {
  const HiveOperations({super.key});

  @override
  State<HiveOperations> createState() => _HiveOperationsState();
}

class _HiveOperationsState extends State<HiveOperations> {
  // refrense created box
  final _username = Hive.box('username');

  final _firstnameController = TextEditingController();
  String firstName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: ValueListenableBuilder(
          valueListenable: _username.listenable(),
          builder: (context, Box _username, child) => SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: Text(
                      _username.get(1).toString(),
                      style: const TextStyle(fontSize: 20, color: Colors.amber),
                    )),
                    GestureDetector(
                      onTap: () => _username.put(1, 'michael'),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 100,
                          color: Colors.purple,
                          child: const Center(child: Text('write data')),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _username.delete(1),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 100,
                          color: Colors.purple,
                          child: const Center(child: Text('delete data')),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextFormField(
                        cursorColor: Colors.deepOrange,
                        controller: _firstnameController,
                        decoration: InputDecoration(
                            hintText: 'First Name',
                            filled: true,
                            fillColor: const Color(0xFFFFFFFF).withOpacity(0.2),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _username.put(
                          firstName, _firstnameController.text.trim()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 100,
                          color: Colors.deepOrange,
                          child: const Center(child: Text('practice data')),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _username.delete(firstName).toString(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 100,
                          color: Colors.deepOrange,
                          child: const Center(child: Text('delete practice')),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: Text(
                      _username.get(firstName).toString(),
                      style: const TextStyle(fontSize: 20, color: Colors.amber),
                    )),
                  ],
                ),
              )),
    );
  }
}

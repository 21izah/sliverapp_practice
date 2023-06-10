import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/user_create_data.dart';

class CreateDataFirebase extends StatefulWidget {
  const CreateDataFirebase({super.key});

  @override
  State<CreateDataFirebase> createState() => _CreateDataFirebaseState();
}

class _CreateDataFirebaseState extends State<CreateDataFirebase> {
  final _firstnameController = TextEditingController();
  final _othernameController = TextEditingController();
  final _surnameController = TextEditingController();

  @override
  void dispose() {
    _firstnameController.dispose();
    _othernameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            controller: _firstnameController,
            decoration: InputDecoration(
                hintText: 'First Name',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50))),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            controller: _othernameController,
            decoration: InputDecoration(
                hintText: 'Other Name',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50))),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            controller: _surnameController,
            decoration: InputDecoration(
                hintText: 'Surname Name',
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50))),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.deepOrange,
                blurRadius: 15,
                offset: Offset(5, 5),
                spreadRadius: 2,
              ),
              BoxShadow(
                color: Colors.black,
                blurRadius: 15,
                offset: Offset(-10, -10),
                spreadRadius: 2,
              ),
            ],
          ),
          // height: 50,
          margin: const EdgeInsets.fromLTRB(80, 0, 90, 0),
          child: GestureDetector(
              onTap: () {
                final firstName = _firstnameController.text.trim();
                createUser(name: firstName);
              },
              child: const Center(
                child: Text(
                  'Create Data',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
              )),
        ),
      ]),
    );
  }

  Future createUser({required String name}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    final docUserId = FirebaseFirestore.instance.collection('users').doc().id;

    // json is a map used to store values as key-value pairs...

    final user = User(
      id: docUserId,
      name: name,
      age: 21,
    );

    final json = user.toJson();
// wait for the docUser to execute then set the data in json map
    await docUser.set(json);
  }
}

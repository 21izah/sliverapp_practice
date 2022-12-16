import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliverapp_practice/pages/sliver_app.dart';
import 'package:sliverapp_practice/pages/welcome_page.dart';

class CrudTesting extends StatefulWidget {
  CrudTesting({Key? key}) : super(key: key);

  @override
  State<CrudTesting> createState() => _CrudTestingState();
}

class _CrudTestingState extends State<CrudTesting> {
  String dataFromFourth = '0';
  goToWelcomePage() {
    Get.to(WelcomePage());
  }

  final _usdtPolygonController = TextEditingController();

  final _busdBep20Controller = TextEditingController();

  @override
  void dispose() {
    _usdtPolygonController.dispose();
    _busdBep20Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: StreamBuilder(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final users = snapshot.data!;
              // ...........
            }
            return ListView(children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  cursorColor: Colors.deepOrange,
                  //   keyboardType: TextInputType.emailAddress,
                  controller: _usdtPolygonController,
                  decoration: InputDecoration(
                      hintText: 'USDT Polygon Wallet Address',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  cursorColor: Colors.deepOrange,
                  //   keyboardType: TextInputType.emailAddress,
                  controller: _busdBep20Controller,
                  decoration: InputDecoration(
                      hintText: 'USDT Polygon Wallet Address',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  cursorColor: Colors.deepOrange,
                  //   keyboardType: TextInputType.emailAddress,
                  controller: _usdtPolygonController,
                  decoration: InputDecoration(
                      hintText: 'USDT Polygon Wallet Address',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // to get access to input in textfield ....
                      final name = _usdtPolygonController.text.trim();
                      createUser(name: name);
                      // to navigate to the next page with stack
                      //   Get.to(WelcomePage());
                      Get.to(SliverAppPractice(),
                          transition: Transition.leftToRight,
                          duration: Duration(seconds: 2),
                          arguments: 'hello');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.pink,
                        child: const Center(child: Text('create')),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      dataFromFourth = await Get.to(SliverAppPractice());
                      setState(() {});
                      // go to the next screen and remove the screen from stack
                      // Get.off(WelcomePage());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.pink,
                        child: const Center(child: Text('read')),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // go to the next scrren and remove everything from stack
                      // Get.offAll(WelcomePage());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.pink,
                        child: const Center(child: Text('update')),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.pink,
                        child: const Center(child: Text('delete')),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.blue.shade900,
                        child: const Center(child: Text('aefueff')),
                      ),
                    ),
                  ),
                ],
              )
            ]);
          }),
    );
  }

  // to read data
  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Future createUser({required String name}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    // json is a map used to store values as key-value pairs...

    final user = User(
      id: docUser.id,
      name: name,
      age: 21,
    );

    final json = user.toJson();
// wait for the docUser to execute then set the data in json map
    await docUser.set(json);
  }
}

// user model
class User {
  String id;
  final String name;
  final int age;

  User({
    required this.name,
    required this.age,
    this.id = '',
  });

  //to convert the 'final user = ...' to a map create the toJson methode
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
      };

  // fromJson method for reading data

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        age: json['age'],
      );
}

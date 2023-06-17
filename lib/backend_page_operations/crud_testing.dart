// ignore_for_file: unused_import, depend_on_referenced_packages, unused_local_variable, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:sliverapp_practice/backend_page_operations/johannes_read_data.dart';
import 'package:sliverapp_practice/backend_page_operations/new%20read/first.dart';
import 'package:sliverapp_practice/backend_page_operations/user_firstname.dart';
import '../model/user.dart';
// importing the countController

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:sliverapp_practice/backend_page_operations/get_user_name.dart';

import 'package:sliverapp_practice/backend_page_operations/hive_operations.dart';
import 'package:sliverapp_practice/backend_page_operations/read_and_display.dart';
import 'package:sliverapp_practice/containers/coinBuySell.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../pages/Splash_screen.dart';
import 'package:sliverapp_practice/pages/pin_code_page.dart';
import 'package:sliverapp_practice/pages/sliver_app.dart';
import 'package:http/http.dart' as http;

import 'Supabase_read_display.dart';
import 'get_firstname_firebase.dart';
import 'read_display_firebase.dart';
import 'read_from_firebase.dart';
import '../backend_page_operations/create_data_firebase.dart';
import 'stream_firstname.dart';
import 'user_id.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../riverpod_practice/changeNotifier_provider.dart';
import 'package:gsheets/gsheets.dart';
import '../api_operations/google_sheets_api.dart';

class CrudTesting extends StatefulWidget {
  // injecting the CountController
  // final counterProvider = ChangeNotifierProvider((ref) => Counter());
  // final CountController countController = Get.put(CountController());
  CrudTesting({Key? key}) : super(key: key);

  Future getBitcoinPrice() async {
    var getBitcoinPriceResponce = await http.get(Uri.https(
        'coingecko.com', '/api/v3/simple/price?ids=bitcoin&vs_currencies=USD'));
  }

  @override
  State<CrudTesting> createState() => _CrudTestingState();
}

class _CrudTestingState extends State<CrudTesting> {
  final docId = FirebaseFirestore.instance.collection('users').doc().id;
  String cenName = 'hello';
  final _username = Hive.box('username');
  String firstName = '';
  String sellRate = '';

  final _usdtPolygonController = TextEditingController();

  final _busdBep20Controller = TextEditingController();

  final _firstnameController = TextEditingController();

  @override
  void dispose() {
    _usdtPolygonController.dispose();
    _busdBep20Controller.dispose();
    _firstnameController.dispose();
    super.dispose();
  }

  void _postRate2s() {
    GoogleSheetsApi.postRates();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final orientation = MediaQuery.of(context).orientation;

    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final systemPadding = MediaQuery.of(context).padding;

    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    if (screenSize.width < 600) {
      print('mobile');
    } else if (screenSize.width > 600) {
      print('tablet');
    } else if (screenSize.width > 800) {
      print('deskotop');
    }

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(),
      child: Scaffold(
          backgroundColor: Colors.deepPurple,
          appBar: AppBar(
              // backgroundColor: Colors.purple,
              ),
          body: ListView(children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Text(GoogleSheetsApi.getRates().toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
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
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                cursorColor: Colors.deepOrange,
                //   keyboardType: TextInputType.emailAddress,
                controller: _firstnameController,
                decoration: InputDecoration(
                    hintText: ' buy rate',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                cursorColor: Colors.deepOrange,
                //   keyboardType: TextInputType.emailAddress,
                controller: _busdBep20Controller,
                decoration: InputDecoration(
                    hintText: 'sell rate',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Column(
              children: [
                // GetBuilder<CountController>(
                //   init: CountController(),
                //   initState: (_) {},
                //   builder: (_) {
                //     return Center(
                //         child: Text('Current Count Value ${_.count}'));
                //   },
                // ),
                GestureDetector(
                  onTap: () {
                    // Get.find<CountController>().increaseCount();
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
                  onTap: () {
                    // to get access to input in textfield ....
                    final name = _usdtPolygonController.text.trim();
                    createUser(name: name);
                    // to navigate to the next page with stack
                    //   Get.to(WelcomePage());
                    Get.to(const SliverAppPractice(),
                        transition: Transition.leftToRight,
                        duration: const Duration(seconds: 2),
                        arguments: cenName);
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
                  onTap: () {
                    _username.put(firstName, _firstnameController.text.trim());
                    _username.put(2, _busdBep20Controller.text.trim());
                  },
                  child: GestureDetector(
                    onDoubleTap: () {
                      Get.to(
                        GetFirstUserName(
                            documentId:
                                '${FirebaseFirestore.instance.collection('users').doc().id}'

                            //  '97HzSzyLcpEd6bZ5NCid',
                            //  FirebaseFirestore.instance
                            //     .collection('users')
                            //     .doc('97HzSzyLcpEd6bZ5NCid')
                            //     .id

                            // FirebaseAuth.instance.currentUser!.uid,
                            ),
                        //  '97HzSzyLcpEd6bZ5NCid'
                        transition: Transition.cupertino,
                        duration: const Duration(seconds: 2),
                      );
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
                ),
                GestureDetector(
                  onDoubleTap: () {
                    Get.to(
                      const HiveOperations(),
                      transition: Transition.cupertino,
                      duration: const Duration(seconds: 2),
                    );
                  },
                  onTap: () async {
                    await Supabase.instance.client
                        .from('cza')
                        .insert({'rates': '750'});
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
                  onTap: () {
                    Get.to(
                      GetFirstName(),
                      transition: Transition.upToDown,
                      duration: const Duration(seconds: 2),
                    );
                  },
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
                  onDoubleTap: () {},
                  onTap: () {
                    if (_usdtPolygonController.text.trim() == 'green') {
                      Get.to(SplashScreen());
                    } else {
                      Get.bottomSheet(Container(
                        height: 800,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20)),
                      ));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 100,
                      color: Colors.blue.shade900,
                      child: const Center(child: Text('gsheet on double tap')),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (Get.isDarkMode) {
                      Get.changeTheme(ThemeData.light());
                    } else if (!Get.isDarkMode) {
                      Get.changeTheme(ThemeData.dark());
                    }
                    ;

                    // else {
                    //   Get.changeTheme(ThemeData.dark());
                    // }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 100,
                      color: Colors.blue.shade900,
                      child: const Center(child: Text('change theme')),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  ReadFirebaseOnly(),
                  transition: Transition.upToDown,
                  duration: const Duration(seconds: 2),
                );
              },
              child: CoinBuySell(
                coinName: 'Solana',
                coinImage: Lottie.asset('lib/assets/bitcoin.json'),
                gradientColor: Colors.pink,
              ),
            ),
          ])),
    );
  }

  Widget buildUser(User user) => Text(user.name);

  // method to read data
  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

// create user method
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
// // get worksheet by its title
//   var sheet = ss.worksheetByTitle('example');
//   // create worksheet if it does not exist yet
//   sheet ??= await ss.addWorksheet('example');

//   // update cell at 'B2' by inserting string 'new'
//   await sheet.values.insertValue('new', column: 2, row: 2);
//   // prints 'new'
//   print(await sheet.values.value(column: 2, row: 2));
//   // get cell at 'B2' as Cell object
//   final cell = await sheet.cells.cell(column: 2, row: 2);
//   // prints 'new'
//   print(cell.value);
//   // update cell at 'B2' by inserting 'new2'
//   await cell.post('new2');
//   // prints 'new2'
//   print(cell.value);
//   // also prints 'new2'
//   print(await sheet.values.value(column: 2, row: 2));

//   // insert list in row #1
//   final firstRow = ['index', 'letter', 'number', 'label'];
//   await sheet.values.insertRow(1, firstRow);
//   // prints [index, letter, number, label]
//   print(await sheet.values.row(1));

//   // insert list in column 'A', starting from row #2
//   final firstColumn = ['0', '1', '2', '3', '4'];
//   await sheet.values.insertColumn(1, firstColumn, fromRow: 2);
//   // prints [0, 1, 2, 3, 4, 5]
//   print(await sheet.values.column(1, fromRow: 2));

//   // insert list into column named 'letter'
//   final secondColumn = ['a', 'b', 'c', 'd', 'e'];
//   await sheet.values.insertColumnByKey('letter', secondColumn);
//   // prints [a, b, c, d, e, f]
//   print(await sheet.values.columnByKey('letter'));

//   // insert map values into column 'C' mapping their keys to column 'A'
//   // order of map entries does not matter
//   final thirdColumn = {
//     '0': '1',
//     '1': '2',
//     '2': '3',
//     '3': '4',
//     '4': '5',
//   };
//   await sheet.values.map.insertColumn(3, thirdColumn, mapTo: 1);
//   // prints {index: number, 0: 1, 1: 2, 2: 3, 3: 4, 4: 5, 5: 6}
//   print(await sheet.values.map.column(3));

//   // insert map values into column named 'label' mapping their keys to column
//   // named 'letter'
//   // order of map entries does not matter
//   final fourthColumn = {
//     'a': 'a1',
//     'b': 'b2',
//     'c': 'c3',
//     'd': 'd4',
//     'e': 'e5',
//   };
//   await sheet.values.map.insertColumnByKey(
//     'label',
//     fourthColumn,
//     mapTo: 'letter',
//   );
//   // prints {a: a1, b: b2, c: c3, d: d4, e: e5, f: f6}
//   print(await sheet.values.map.columnByKey('label', mapTo: 'letter'));

//   // appends map values as new row at the end mapping their keys to row #1
//   // order of map entries does not matter
//   final secondRow = {
//     'index': '5',
//     'letter': 'f',
//     'number': '6',
//     'label': 'f6',
//   };
//   await sheet.values.map.appendRow(secondRow);
//   // prints {index: 5, letter: f, number: 6, label: f6}
//   print(await sheet.values.map.lastRow());

//   // get first row as List of Cell objects
//   final cellsRow = await sheet.cells.row(1);
//   // update each cell's value by adding char '_' at the beginning
//   cellsRow.forEach((cell) => cell.value = '_${cell.value}');
//   // actually updating sheets cells
//   await sheet.cells.insert(cellsRow);
//   // prints [_index, _letter, _number, _label]
//   print(await sheet.values.row(1));
// }
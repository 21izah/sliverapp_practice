import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliverAppPractice extends StatefulWidget {
  const SliverAppPractice({Key? key}) : super(key: key);

  @override
  State<SliverAppPractice> createState() => _SliverAppPracticeState();
}

class _SliverAppPracticeState extends State<SliverAppPractice> {
  String dataFromFourth = '0';
  String cenName = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'lib/assets/Cza.jpg',
                fit: BoxFit.cover,
              ),

              // title: Text(
              //   'Cza',
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                child: Container(
                  child: Center(
                    child: Text(
                      cenName,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  height: 400,
                  color: Colors.purple,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                child: Container(
                  height: 400,
                  color: Colors.green,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                child: Container(
                  height: 400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                child: Container(
                  height: 400,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

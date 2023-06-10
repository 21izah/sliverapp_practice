// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:sliverapp_practice/pages/declined_tab_page.dart';
import 'package:sliverapp_practice/pages/processing_tab_page.dart';
import 'package:sliverapp_practice/pages/successful_tab_page.dart';

import '../constants/data_constant.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        // appBar: AppBar(
        //   backgroundColor: Colors.black,
        //   foregroundColor: Colors.deepOrange,
        // ),
        body: Column(
          children: const [
            SizedBox(
              height: 30,
            ),
            TabBar(indicatorColor: Colors.deepOrange, tabs: [
              Tab(
                ///  text: 'Successful',
                // icon: Icon(
                //   Icons.handshake,
                //   color: Colors.green,
                // ),
                child: Text(
                  'SUCCESSFUL',
                  style: TextStyle(color: Colors.green),
                ),
              ),
              Tab(
                //  text: 'Processing',
                // icon: Icon(
                //   Icons.cancel,
                //   color: Colors.red,
                // ),

                child: Text(
                  'DECLINED',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Tab(
                //  text: 'Processing',
                // icon: Icon(
                //   Icons.cancel,
                //   color: Colors.blue,
                // ),

                child: Text(
                  'PROCESSING',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ]),
            Expanded(
              child: TabBarView(children: [
                SuccesfulTabPage(),
                ProcessingTabPage(),
                DeclinedTabPage(),

                // Center(child: Text("BUY")),

                // Center(child: Text("SELL")),

                // Center(child: Text("Dront buy")),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

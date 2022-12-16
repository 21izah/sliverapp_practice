import 'package:flutter/material.dart';
import 'package:sliverapp_practice/pages/declined_tab_page.dart';
import 'package:sliverapp_practice/pages/processing_tab_page.dart';
import 'package:sliverapp_practice/pages/successful_tab_page.dart';

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
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Transactions'),
        ),
        body: Column(
          children: const [
            TabBar(indicatorColor: Colors.deepOrange, tabs: [
              Tab(
                ///  text: 'Successful',
                icon: Icon(
                  Icons.handshake,
                  color: Colors.green,
                ),
                child: Text(
                  'Successful',
                  style: TextStyle(color: Colors.green),
                ),
              ),
              Tab(
                //  text: 'Processing',
                icon: Icon(
                  Icons.outgoing_mail,
                  color: Colors.blue,
                ),

                child: Text(
                  'Processing',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Tab(
                //  text: 'Declined',
                icon: Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),

                child: Text(
                  'Declined',
                  style: TextStyle(color: Colors.red),
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

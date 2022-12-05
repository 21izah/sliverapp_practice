// ignore_for_file: avoid_unnecessary_containers, constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:sliverapp_practice/pages/help_page.dart';
import 'package:sliverapp_practice/pages/sliver_app.dart';
import 'package:sliverapp_practice/pages/tab_bar.dart';
import 'package:sliverapp_practice/pages/welcomesixth_page.dart';
import 'package:sliverapp_practice/pages/welcome_page.dart';

class PopUpMenuButtonWidget extends StatelessWidget {
  const PopUpMenuButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: PopupMenuButton<MenuItem>(
        color: Colors.amber,
        onSelected: (value) {
          if (value == MenuItem.hello) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SliverAppPractice()));
          } else if (value == MenuItem.welcome) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SixthPage()));
          } else if (value == MenuItem.True) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const TabBarWidget()));
          }
        },
        itemBuilder: (context) => [
          const PopupMenuItem(value: MenuItem.hello, child: Text("hello")),
          const PopupMenuItem(value: MenuItem.welcome, child: Text("welcome")),
          const PopupMenuItem(value: MenuItem.True, child: Text("True")),
        ],
      ),
    );
  }
}

enum MenuItem { hello, welcome, True }

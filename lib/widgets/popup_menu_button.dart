import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:sliverapp_practice/pages/buy_page.dart';
// import 'package:sliverapp_practice/pages/tab_bar.dart';
// import 'package:sliverapp_practice/widgets/hidden_drawer.dart';

import '../pages/welcomesixth_page.dart';

class PopUpMenuButtonWidget extends StatelessWidget {
  const PopUpMenuButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: PopupMenuButton<MenuItem>(
        color: Theme.of(context).colorScheme.background,
        onSelected: (value) {
          if (value == MenuItem.hello) {
            Get.to(
              SixthPage(),
              transition: Transition.circularReveal,
              duration: const Duration(seconds: 2),
            );
          }

          // else if (value == MenuItem.welcome) {
          //   Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => const SixthPage()));
          // } else if (value == MenuItem.True) {
          //   Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => const TabBarWidget()));
          // }
        },
        itemBuilder: (context) => [
          const PopupMenuItem(value: MenuItem.hello, child: Text("Home")),
          // const PopupMenuItem(
          //     value: MenuItem.welcome, child: Text("Wallet Address")),
          // const PopupMenuItem(value: MenuItem.True, child: Text("Profile")),
        ],
      ),
    );
  }
}

enum MenuItem { hello, welcome, True }

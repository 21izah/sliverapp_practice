import 'package:flutter/material.dart';
import 'package:sliverapp_practice/widgets/drop_down_widget.dart';
import 'package:sliverapp_practice/widgets/popup_menu_button.dart';

class EighthPage extends StatelessWidget {
  const EighthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 126, 8, 8),
      appBar: AppBar(
        actions: const [
          PopUpMenuButtonWidget(),
        ],
        // title: Text('eight'),
        backgroundColor: Colors.black,
      ),
      body: const DropDownMenuWidget(),
    );
    // );
  }
}

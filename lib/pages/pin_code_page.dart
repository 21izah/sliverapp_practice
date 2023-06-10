// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sliverapp_practice/widgets/hidden_drawer.dart';

class PinCodePage extends StatefulWidget {
  const PinCodePage({super.key});

  @override
  State<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: 400,
              width: 400,
              child: Lottie.asset('lib/assets/77096-service.json'),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Enter your Cza Exchange Pin',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            content(),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Forgot Pin?',
              style: TextStyle(color: Colors.deepOrange, fontSize: 15),
            ),
          ],
        ),
      )),
    );
  }

  Widget content() {
    return Form(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          height: 50,
          width: 50,
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            decoration: InputDecoration(

                // hintText: 'O',
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.green,
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(10))),
            style: Theme.of(context).textTheme.bodyLarge,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        SizedBox(
          height: 50,
          width: 50,
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            decoration: InputDecoration(
                // hintText: 'O',
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.green,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
            style: Theme.of(context).textTheme.bodyLarge,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          height: 50,
          width: 50,
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            decoration: InputDecoration(
                // hintText: 'O',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
            style: Theme.of(context).textTheme.bodyLarge,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          height: 50,
          width: 50,
          child: TextFormField(
            cursorColor: Colors.deepOrange,
            onChanged: (value) {
              if (value.length == 1) {
                Get.to(
                  const HiddenDrawer(),
                  transition: Transition.upToDown,
                  duration: const Duration(seconds: 2),
                );
              }
            },
            decoration: InputDecoration(
                // hintText: 'O',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
            style: Theme.of(context).textTheme.bodyLarge,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
      ]),
    );
  }
}

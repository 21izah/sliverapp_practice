import 'package:flutter/material.dart';

class YouGetTextfield extends StatefulWidget {
  const YouGetTextfield({super.key});

  @override
  State<YouGetTextfield> createState() => _YouGetTextfieldState();
}

class _YouGetTextfieldState extends State<YouGetTextfield> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _btcController = TextEditingController();
  final _nairaController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _btcController.dispose();
    _nairaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        readOnly: true,
        // onChanged: (value) {},
        controller: _nairaController,
        cursorColor: Colors.deepOrange,
        decoration: InputDecoration(
            suffixText: "BTC",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'YOU GET ',
            filled: true,
            fillColor: Colors.white.withOpacity(0.9),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}

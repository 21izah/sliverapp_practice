import 'package:flutter/material.dart';

class DeleteMessageButton extends StatelessWidget {
  final void Function()? onTap;
  const DeleteMessageButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }
}

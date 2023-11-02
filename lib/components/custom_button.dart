import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;
  const CustomButton(
      {super.key, required this.btnText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(btnText));
  }
}

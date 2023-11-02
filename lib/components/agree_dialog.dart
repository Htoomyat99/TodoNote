import 'package:flutter/material.dart';

class AgreeDialog extends StatelessWidget {
  final Function() onPressed;
  const AgreeDialog({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
          height: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.compass_calibration,
                color: Colors.red.shade300,
              ),
              Text(
                'OOPS! Add some text',
                style: TextStyle(
                    color: Colors.red.shade300, fontWeight: FontWeight.w500),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade300),
                  onPressed: onPressed,
                  child: const Text(
                    'Got it',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ))
            ],
          )),
    );
  }
}

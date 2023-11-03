import 'package:flutter/material.dart';
import 'package:todo_app/components/custom_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSaved;
  final VoidCallback onCancel;
  final String hintText;

  const DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSaved,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
          height: 140,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.yellow.shade600,
                    ),
                  ),
                  hintText: hintText,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    btnText: 'Cancel',
                    onPressed: onCancel,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    btnText: 'Save',
                    onPressed: onSaved,
                  ),
                ],
              )
            ],
          )),
    );
  }
}

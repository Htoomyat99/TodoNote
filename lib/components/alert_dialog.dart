import 'package:flutter/material.dart';
import 'package:todo_app/components/custom_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSaved;
  final VoidCallback onCancel;
  const DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSaved});

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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new task',
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

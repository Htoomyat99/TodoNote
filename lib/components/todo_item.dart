import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoItem extends StatelessWidget {
  final String todoText;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;
  final Function(BuildContext)? goEditTask;

  const ToDoItem(
      {super.key,
      required this.todoText,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteTask,
      required this.goEditTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
            SlidableAction(
              onPressed: goEditTask,
              icon: Icons.edit,
              backgroundColor: Colors.green,
              borderRadius: BorderRadius.circular(8),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 231, 209, 9),
              borderRadius: BorderRadius.circular(5)),
          // margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.brown,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                todoText,
                style: TextStyle(
                    decoration:
                        taskCompleted ? TextDecoration.lineThrough : null,
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                width: 125,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

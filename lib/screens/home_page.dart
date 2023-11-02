import 'package:flutter/material.dart';
import 'package:todo_app/components/agree_dialog.dart';
import 'package:todo_app/components/alert_dialog.dart';
import 'package:todo_app/components/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //textfield
  final _controller = TextEditingController();

  //lists of items
  List toDoList = [
    ['Make Tutorials', false],
    ['Do Exercise', true],
  ];

  //checkBoxChange
  void checkBoxChange(bool? val, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void onPressed() {
    Navigator.of(context).pop();
  }

  //save Task
  void saveNewTask() {
    if (_controller.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AgreeDialog(
            onPressed: onPressed,
          );
        },
      );
    } else {
      setState(() {
        toDoList.add([_controller.text, false]);
        _controller.clear();
        Navigator.of(context).pop();
      });
    }
  }

  void creatNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSaved: saveNewTask,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('TO DO'),
        centerTitle: true,
        elevation: 0.2,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: creatNewTask,
        child: const Icon(
          Icons.add,
          size: 25,
          color: Colors.brown,
        ),
      ),
      body: toDoList.isNotEmpty
          ? ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (context, index) {
                return ToDoItem(
                  todoText: toDoList[index][0],
                  taskCompleted: toDoList[index][1],
                  onChanged: (val) => checkBoxChange(val, index),
                  deleteTask: (context) => deleteTask(index),
                );
              },
            )
          : const Center(
              child: Text(
              'No New Note!',
              style: TextStyle(
                  color: Colors.brown,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )),
    );
  }
}

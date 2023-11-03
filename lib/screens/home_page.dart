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
  final _editController = TextEditingController();

  //lists of items
  List toDoList = [];

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
        debugPrint('$_controller');
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
          hintText: 'Add New Task',
        );
      },
    );
  }

  void deleteTask(index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void goEditTask(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _editController,
          onCancel: onPressed,
          onSaved: () => editTask(index),
          hintText: 'Edit',
        );
      },
    );
  }

  void editTask(int index) {
    if (_editController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AgreeDialog(
            onPressed: onPressed,
          );
        },
      );
    } else {
      setState(
        () {
          var text = _editController.text;
          toDoList[index][0] = text;
          Navigator.of(context).pop();
          _editController.clear();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                    goEditTask: (context) => goEditTask(context, index),
                  );
                },
              )
            : const Center(
                child: Text(
                  'No New Note!',
                  style: TextStyle(
                      color: Colors.black26,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
      ),
    );
  }
}

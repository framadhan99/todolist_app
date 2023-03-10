import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist_app/data/database.dart';
import 'package:todolist_app/widgets/dialog_box.dart';

import '../widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBox');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createIntialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  TextEditingController _controller = TextEditingController();

  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.text = "";
    });

    db.updateDatabase();
  }

  void creatNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            onCencel: () {
              Navigator.of(context).pop();
              _controller.text = "";
            },
            onSave: saveNewTask,
            controller: _controller,
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    // bool value = false;
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: const Text(
          'TO DO',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[400],
        onPressed: creatNewTask,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) => TodoTile(
          taskName: db.todoList[index][0],
          taskCompleted: db.todoList[index][1],
          onChanged: (value) => checkBoxChange(value, index),
          deleteFunction: (context) => deleteTask(index),
        ),
      ),
    );
  }
}

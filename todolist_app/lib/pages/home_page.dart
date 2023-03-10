import 'package:flutter/material.dart';

import '../widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List toDoList = [
    ['Make your to do', false],
    ['To do', false],
  ];

  void checkBoxChange(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
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
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) => TodoTile(
          taskName: toDoList[index][0],
          taskCompleted: toDoList[index][1],
          onChanged: (value) => checkBoxChange(value, index),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/todo_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          TodoTile(
            taskName: 'Make your to do list',
            taskCompleted: true,
          ),
        ],
      ),
    );
  }
}

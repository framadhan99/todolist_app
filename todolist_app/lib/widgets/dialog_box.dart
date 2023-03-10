import 'package:flutter/material.dart';
import 'package:todolist_app/widgets/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCencel;
  DialogBox({
    super.key,
    this.controller,
    required this.onSave,
    required this.onCencel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Add new task',
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: 'Save', onPressed: onSave),
                const SizedBox(width: 4),
                MyButton(text: 'Cencel', onPressed: onCencel)
              ],
            )
          ],
        ),
      ),
    );
  }
}

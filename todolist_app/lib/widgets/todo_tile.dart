import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Checkbox(value: taskCompleted, onChanged: onChanged),
          Text(
            taskName,
            style: TextStyle(
              decoration: taskCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}

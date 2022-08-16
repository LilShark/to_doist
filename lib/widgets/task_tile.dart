import 'package:flutter/material.dart';
import 'package:to_doist/constants.dart';

class TaskTile extends StatelessWidget {
  bool isDone;
  final String taskName;
  final Function() onLongPress;
  final Function(bool?) onChanged;
  TaskTile(
      {required this.isDone,
      required this.taskName,
      required this.onLongPress,
      required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        taskName,
        style: TextStyle(
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: kButtonColor,
        value: isDone,
        onChanged: onChanged,
      ),
    );
  }
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  String taskName;
  final  taskCompleted;
  Function(bool?)? onChanged;
   ToDoTile({super.key, 
  required this.taskName,
  required this.taskCompleted,
  required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        // ignore: sort_child_properties_last
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Colors.black,),
             Text(taskName),
            
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

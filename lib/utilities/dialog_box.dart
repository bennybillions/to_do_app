import 'package:flutter/material.dart';
import 'package:to_do_app/utilities/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
final myController;
  VoidCallback onSave;
  VoidCallback onCancel;
   //VoidCallback is a typedef (type definition) in Flutter that represents a function with no arguments and no return value. It's commonly used to define callback functions, particularly for handling user interactions such as button presses or other events

   DialogBox({super.key, required this.myController, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             TextField(
              controller: myController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: 'save', onPressed: onSave),
                const SizedBox(width: 8,),
                MyButton(text: 'cancel', onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}

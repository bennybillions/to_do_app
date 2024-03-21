import 'package:flutter/material.dart';
import '../utilities/dialog_box.dart';
// ignore: unused_import
import '../utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final _controller = TextEditingController();
void saveNewTask(){
  setState(() {
    toDoList.add([_controller.text, false]);
    Navigator.of(context).pop();
    _controller.clear();
  });
} 

//_controller is an instance of TextEditingController or a similar controller used to manage text input.
  List toDoList = [
    ['Do exercise', false],
    ['Make Tutorial', false]
  ];
  void checkBoxChanged(
    bool? value,
    int index,
  ) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return  DialogBox(myController: _controller,onSave: saveNewTask, onCancel: () => Navigator.of(context).pop(),);

        //DialogBox that takes a parameter named myController of type _controller

        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('to do'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}

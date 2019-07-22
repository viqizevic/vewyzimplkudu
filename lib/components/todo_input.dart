import 'package:flutter/material.dart';
import 'package:very_simple_todo_app/constants.dart';

class TodoInput extends StatefulWidget {
  TodoInput(this.addTodo);

  final Function addTodo;

  @override
  _TodoInputState createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  final inputTextController = TextEditingController();

  void _submitData() {
    final enteredTodo = inputTextController.text;
    if (enteredTodo.isEmpty) {
      return;
    }
    widget.addTodo(enteredTodo);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: inputTextController,
              decoration: kMessageTextFieldDecoration,
              onSubmitted: (_) => _submitData(),
            ),
            RaisedButton(
              onPressed: _submitData,
              color: Colors.blueAccent,
              child: Text(
                'Add',
                style: kSaveButtonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

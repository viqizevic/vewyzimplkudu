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
    return Container(
      decoration: kMessageContainerDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: inputTextController,
              decoration: kMessageTextFieldDecoration,
              onSubmitted: (_) => _submitData(),
            ),
          ),
          FlatButton(
            onPressed: _submitData,
            child: Text(
              'Add TODO',
              style: kSaveButtonTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

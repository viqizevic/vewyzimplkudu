import 'package:flutter/material.dart';
import 'package:very_simple_todo_app/constants.dart';

class TodoInput extends StatelessWidget {
  TodoInput(this.addTodo);

  final inputTextController = TextEditingController();
  final Function addTodo;

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
            ),
          ),
          FlatButton(
            onPressed: () {
              addTodo(inputTextController.text);
              inputTextController.clear();
            },
            child: Text(
              'Save',
              style: kSaveButtonTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

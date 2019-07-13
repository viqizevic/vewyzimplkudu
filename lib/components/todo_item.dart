import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:very_simple_todo_app/constants.dart';

class TodoItem extends StatelessWidget {
  TodoItem(this.todoText, this.onPressRemove);

  final String todoText;
  final Function onPressRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(15.0),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(todoText, style: kTodoTextStyle),
              ),
              GestureDetector(
                onTap: onPressRemove,
                child: Icon(
                  FontAwesomeIcons.trash,
                  size: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

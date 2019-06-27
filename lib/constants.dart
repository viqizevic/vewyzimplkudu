import 'package:flutter/material.dart';

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'New TODO',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kEmptyListTextStyle = TextStyle(
  color: Colors.blueGrey,
  fontStyle: FontStyle.italic,
  fontSize: 18.0,
);

const kTodoTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 22.0,
);

const kSaveButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

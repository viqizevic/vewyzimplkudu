import 'package:flutter/material.dart';

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  labelText: 'TODO',
  hintText: 'New TODO',
  border: InputBorder.none,
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
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

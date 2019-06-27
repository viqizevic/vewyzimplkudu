import 'package:flutter/material.dart';
import 'constants.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Your Very Simple TODO List';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: TodoList(),
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  void initState() {
    super.initState();
    todos = [];
  }

  List<String> todos;
  String newTodo;
  final inputTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: todos.isNotEmpty
                  ? ListView(
                      children: todos.map((e) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Material(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(15.0),
                            elevation: 5.0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                e,
                                style: kTodoTextStyle,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : Text(
                      'Empty.',
                      style: kEmptyListTextStyle,
                    ),
            ),
          ),
          Container(
            decoration: kMessageContainerDecoration,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: inputTextController,
                    onChanged: (value) {
                      newTodo = value;
                    },
                    decoration: kMessageTextFieldDecoration,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    inputTextController.clear();
                    setState(() {
                      todos.add(newTodo);
                    });
                  },
                  child: Text(
                    'Save',
                    style: kSaveButtonTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

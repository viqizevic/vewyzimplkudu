import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';
import 'components/todo_item.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Your Simple TODO List';

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
    _getTodos();
  }

  _getTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      todos = (prefs.getStringList('todos') ?? []);
    });
  }

  _saveTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('todos', todos);
  }

  void addTodo(String item) {
    if (null == item || "" == item) return;
    setState(() {
      todos.add(newTodo);
    });
    _saveTodos();
  }

  void removeTodo(String item) {
    setState(() {
      todos.remove(item);
    });
    _saveTodos();
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
                  ? ListView.builder(
                      itemBuilder: (ctx, index) {
                        return TodoItem(todos[index], () {
                          removeTodo(todos[index]);
                        });
                      },
                      itemCount: todos.length,
                    )
                  : Text(
                      'Click the \'+\' button to add a new TODO.',
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
                    newTodo = inputTextController.text;
                    inputTextController.clear();
                    addTodo(newTodo);
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

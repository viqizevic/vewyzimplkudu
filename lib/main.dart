import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';
import 'components/todo_item.dart';
import 'components/todo_input.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Your Simple TODO List';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: TodoList(_title),
    );
  }
}

class TodoList extends StatefulWidget {
  String title;
  TodoList(this.title);
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> todos;
  bool isInEditMode = false;

  @override
  void initState() {
    super.initState();
    todos = [];
    isInEditMode = false;
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
      todos.add(item);
    });
    _saveTodos();
  }

  void removeTodo(String item) {
    setState(() {
      todos.remove(item);
    });
    _saveTodos();
  }

  void _startAddNewTodo(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: SafeArea(child: TodoInput(addTodo)),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Visibility(
            visible: todos.isNotEmpty,
            child: IconButton(
              icon: Icon(
                Icons.mode_edit,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  isInEditMode = !isInEditMode;
                });
              },
            ),
          )
        ],
      ),
      body: SafeArea(
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
                          return TodoItem(todos[index], isInEditMode, () {
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
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTodo(context),
      ),
    );
  }
}

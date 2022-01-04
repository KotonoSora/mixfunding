import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mixfunding/widget/todo_list.dart';
import 'package:mixfunding/provider/todos.dart';
import 'package:mixfunding/model/todo/todo_item.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _tabs = [
      TodoList(),
      Container(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Completed',
          ),
        ],
      ),
      body: Scrollbar(
        child: _tabs[_selectedIndex],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const AddTodoDialog();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({Key? key}) : super(key: key);

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  String title = '';
  String description = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Todo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TodoForm(
              onChangedTitle: (String title) {
                setState(() {
                  this.title = title;
                });
              },
              onChangedDescription: (String description) {
                setState(() {
                  this.description = description;
                });
              },
              onSavedTodo: () {
                final isValid = _formKey.currentState!.validate();
                if (!isValid) return;

                provider.createTodo(
                  TodoItem.fromJson({
                    "title": title,
                    "description": description,
                    "isDone": false,
                    "createdTime": DateTime.now().toString(),
                    "id": DateTime.now().millisecondsSinceEpoch.toString(),
                  }),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TodoForm extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  const TodoForm({
    Key? key,
    this.title = '',
    this.description = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            maxLines: 1,
            initialValue: title,
            onChanged: onChangedTitle,
            validator: (String? title) {
              if (title == null) {
                return 'The title cannot be empty';
              }
              return null;
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Title',
            ),
          ),
          TextFormField(
            maxLines: 3,
            initialValue: description,
            onChanged: onChangedDescription,
            validator: (String? description) {
              if (description == null) {
                return 'The description cannot be empty';
              }
              return null;
            },
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Description',
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onSavedTodo,
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:mixfunding/model/todo/todo_item.dart';

class TodosProvider extends ChangeNotifier {
  List<TodoItem> _todos = [
    TodoItem.fromJson({
      "title": "first todo",
      "description": "description todo",
      "createdTime": DateTime.now().toString(),
      "id": "asdfasd",
      "isDone": false,
    }),
    TodoItem.fromJson({
      "title": "secondary todo",
      "description": "description todo",
      "createdTime": DateTime.now().toString(),
      "id": "asdfasdasdfsdf",
      "isDone": false,
    }),
    TodoItem.fromJson({
      "title": "third todo",
      "description": "description todo",
      "createdTime": DateTime.now().toString(),
      "id": "asdfasd",
      "isDone": false,
    }),
  ];

  List<TodoItem> get todos =>
      _todos.where((TodoItem it) => it.isDone == false).toList();

  void createTodo(TodoItem todo) {
    _todos.add(todo);

    notifyListeners();
  }
}

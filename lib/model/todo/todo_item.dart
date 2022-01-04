import 'package:json_annotation/json_annotation.dart';

part 'todo_item.g.dart';

@JsonSerializable()
class TodoItem {
  TodoItem(
    this.title,
    this.description,
    this.createdTime,
    this.id,
    this.isDone,
  );

  String title;
  String description;
  DateTime createdTime;
  String id;
  bool isDone;

  factory TodoItem.fromJson(Map<String, dynamic> json) =>
      _$TodoItemFromJson(json);

  Map<String, dynamic> toJson() => _$TodoItemToJson(this);
}

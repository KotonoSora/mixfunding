// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoItem _$TodoItemFromJson(Map<String, dynamic> json) => TodoItem(
      json['title'] as String,
      json['description'] as String,
      DateTime.parse(json['createdTime'] as String),
      json['id'] as String,
      json['isDone'] as bool,
    );

Map<String, dynamic> _$TodoItemToJson(TodoItem instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'createdTime': instance.createdTime.toIso8601String(),
      'id': instance.id,
      'isDone': instance.isDone,
    };

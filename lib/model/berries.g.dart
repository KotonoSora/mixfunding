// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Berries _$BerriesFromJson(Map<String, dynamic> json) => Berries(
      json['count'] as int,
      json['next'] as String?,
      json['previous'] as String?,
      (json['results'] as List<dynamic>)
          .map((e) => Berry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BerriesToJson(Berries instance) => <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

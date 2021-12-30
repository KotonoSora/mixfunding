// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_game_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionGameIndex _$VersionGameIndexFromJson(Map<String, dynamic> json) =>
    VersionGameIndex(
      json['game_index'] as int,
      NamedAPIResource.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VersionGameIndexToJson(VersionGameIndex instance) =>
    <String, dynamic>{
      'game_index': instance.game_index,
      'version': instance.version,
    };

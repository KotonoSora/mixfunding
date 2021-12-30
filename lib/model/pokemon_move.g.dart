// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_move.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonMove _$PokemonMoveFromJson(Map<String, dynamic> json) => PokemonMove(
      NamedAPIResource.fromJson(json['move'] as Map<String, dynamic>),
      (json['version_group_details'] as List<dynamic>)
          .map((e) => PokemonMoveVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonMoveToJson(PokemonMove instance) =>
    <String, dynamic>{
      'move': instance.move,
      'version_group_details': instance.version_group_details,
    };

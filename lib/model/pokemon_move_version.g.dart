// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_move_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonMoveVersion _$PokemonMoveVersionFromJson(Map<String, dynamic> json) =>
    PokemonMoveVersion(
      NamedAPIResource.fromJson(
          json['move_learn_method'] as Map<String, dynamic>),
      NamedAPIResource.fromJson(json['version_group'] as Map<String, dynamic>),
      json['level_learned_at'] as int,
    );

Map<String, dynamic> _$PokemonMoveVersionToJson(PokemonMoveVersion instance) =>
    <String, dynamic>{
      'move_learn_method': instance.move_learn_method,
      'version_group': instance.version_group,
      'level_learned_at': instance.level_learned_at,
    };

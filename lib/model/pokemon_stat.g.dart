// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonStat _$PokemonStatFromJson(Map<String, dynamic> json) => PokemonStat(
      NamedAPIResource.fromJson(json['stat'] as Map<String, dynamic>),
      json['effort'] as int,
      json['base_stat'] as int,
    );

Map<String, dynamic> _$PokemonStatToJson(PokemonStat instance) =>
    <String, dynamic>{
      'stat': instance.stat,
      'effort': instance.effort,
      'base_stat': instance.base_stat,
    };

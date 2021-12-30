// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_ability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonAbility _$PokemonAbilityFromJson(Map<String, dynamic> json) =>
    PokemonAbility(
      json['is_hidden'] as bool,
      json['slot'] as int,
      NamedAPIResource.fromJson(json['ability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonAbilityToJson(PokemonAbility instance) =>
    <String, dynamic>{
      'is_hidden': instance.is_hidden,
      'slot': instance.slot,
      'ability': instance.ability,
    };

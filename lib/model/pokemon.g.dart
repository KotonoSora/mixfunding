// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      json['id'] as int,
      json['name'] as String,
      json['base_experience'] as int,
      json['height'] as int,
      json['is_default'] as int,
      json['order'] as int,
      json['weight'] as int,
      PokemonAbility.fromJson(json['abilities'] as Map<String, dynamic>),
      (json['forms'] as List<dynamic>)
          .map((e) => NamedAPIResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      VersionGameIndex.fromJson(json['game_indices'] as Map<String, dynamic>),
      PokemonHeldItem.fromJson(json['held_items'] as Map<String, dynamic>),
      json['location_area_encounters'] as String,
      (json['moves'] as List<dynamic>)
          .map((e) => PokemonMove.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['past_types'] as List<dynamic>)
          .map((e) => PokemonTypePast.fromJson(e as Map<String, dynamic>))
          .toList(),
      PokemonSprites.fromJson(json['sprites'] as Map<String, dynamic>),
      (json['species'] as List<dynamic>)
          .map((e) => NamedAPIResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['stats'] as List<dynamic>)
          .map((e) => PokemonStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['types'] as List<dynamic>)
          .map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_experience': instance.base_experience,
      'height': instance.height,
      'is_default': instance.is_default,
      'order': instance.order,
      'weight': instance.weight,
      'abilities': instance.abilities,
      'forms': instance.forms,
      'game_indices': instance.game_indices,
      'held_items': instance.held_items,
      'location_area_encounters': instance.location_area_encounters,
      'moves': instance.moves,
      'past_types': instance.past_types,
      'sprites': instance.sprites,
      'species': instance.species,
      'stats': instance.stats,
      'types': instance.types,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_help_item_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonHeldItemVersion _$PokemonHeldItemVersionFromJson(
        Map<String, dynamic> json) =>
    PokemonHeldItemVersion(
      NamedAPIResource.fromJson(json['version'] as Map<String, dynamic>),
      json['rarity'] as int,
    );

Map<String, dynamic> _$PokemonHeldItemVersionToJson(
        PokemonHeldItemVersion instance) =>
    <String, dynamic>{
      'version': instance.version,
      'rarity': instance.rarity,
    };

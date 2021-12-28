// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_help_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonHeldItem _$PokemonHeldItemFromJson(Map<String, dynamic> json) =>
    PokemonHeldItem(
      NamedAPIResource.fromJson(json['item'] as Map<String, dynamic>),
      PokemonHeldItemVersion.fromJson(
          json['version_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonHeldItemToJson(PokemonHeldItem instance) =>
    <String, dynamic>{
      'item': instance.item,
      'version_details': instance.version_details,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flavor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flavor _$FlavorFromJson(Map<String, dynamic> json) => Flavor(
      json['potency'] as int,
      NamedAPIResource.fromJson(json['flavor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlavorToJson(Flavor instance) => <String, dynamic>{
      'potency': instance.potency,
      'flavor': instance.flavor,
    };

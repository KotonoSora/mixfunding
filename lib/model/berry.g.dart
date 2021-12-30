// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Berry _$BerryFromJson(Map<String, dynamic> json) => Berry(
      json['id'] as int,
      json['name'] as String,
      json['growth_time'] as int,
      json['max_harvest'] as int,
      json['natural_gift_power'] as int,
      json['size'] as int,
      json['smoothness'] as int,
      json['soil_dryness'] as int,
      NamedAPIResource.fromJson(json['firmness'] as Map<String, dynamic>),
      (json['flavors'] as List<dynamic>)
          .map((e) => Flavor.fromJson(e as Map<String, dynamic>))
          .toList(),
      NamedAPIResource.fromJson(json['item'] as Map<String, dynamic>),
      NamedAPIResource.fromJson(
          json['natural_gift_type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BerryToJson(Berry instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'growth_time': instance.growth_time,
      'max_harvest': instance.max_harvest,
      'natural_gift_power': instance.natural_gift_power,
      'size': instance.size,
      'smoothness': instance.smoothness,
      'soil_dryness': instance.soil_dryness,
      'firmness': instance.firmness,
      'flavors': instance.flavors,
      'item': instance.item,
      'natural_gift_type': instance.natural_gift_type,
    };

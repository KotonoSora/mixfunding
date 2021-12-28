// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flavors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flavors _$FlavorsFromJson(Map<String, dynamic> json) => Flavors(
      json['potency'] as int,
      NamedAPIResource.fromJson(json['flavor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlavorsToJson(Flavors instance) => <String, dynamic>{
      'potency': instance.potency,
      'flavor': instance.flavor,
    };

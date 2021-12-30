import 'package:json_annotation/json_annotation.dart';

import 'package:mixfunding/model/named_api_resource.dart';
import 'package:mixfunding/model/flavor.dart';

part 'berry.g.dart';

@JsonSerializable()
class Berry {
  Berry(
    this.id,
    this.name,
    this.growth_time,
    this.max_harvest,
    this.natural_gift_power,
    this.size,
    this.smoothness,
    this.soil_dryness,
    this.firmness,
    this.flavors,
    this.item,
    this.natural_gift_type,
  );

  int id;
  String name;
  int growth_time;
  int max_harvest;
  int natural_gift_power;
  int size;
  int smoothness;
  int soil_dryness;
  NamedAPIResource firmness;
  List<Flavor> flavors;
  NamedAPIResource item;
  NamedAPIResource natural_gift_type;

  factory Berry.fromJson(Map<String, dynamic> json) => _$BerryFromJson(json);

  Map<String, dynamic> toJson() => _$BerryToJson(this);
}

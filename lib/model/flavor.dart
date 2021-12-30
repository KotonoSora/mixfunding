import 'package:json_annotation/json_annotation.dart';

import 'package:mixfunding/model/named_api_resource.dart';

part 'flavor.g.dart';

@JsonSerializable()
class Flavor {
  Flavor(
    this.potency,
    this.flavor,
  );

  int potency;
  NamedAPIResource flavor;

  factory Flavor.fromJson(Map<String, dynamic> json) => _$FlavorFromJson(json);

  Map<String, dynamic> toJson() => _$FlavorToJson(this);
}

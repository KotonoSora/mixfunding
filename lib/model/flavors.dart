import 'package:json_annotation/json_annotation.dart';

import 'package:mixfunding/model/named_api_resource.dart';

part 'flavors.g.dart';

@JsonSerializable()
class Flavors {
  Flavors(
    this.potency,
    this.flavor,
  );

  int potency;
  NamedAPIResource flavor;

  factory Flavors.fromJson(Map<String, dynamic> json) =>
      _$FlavorsFromJson(json);

  Map<String, dynamic> toJson() => _$FlavorsToJson(this);
}

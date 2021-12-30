import 'package:json_annotation/json_annotation.dart';

import 'package:mixfunding/model/named_api_resource.dart';

part 'pokemon_help_item_version.g.dart';

@JsonSerializable()
class PokemonHeldItemVersion {
  PokemonHeldItemVersion(
    this.version,
    this.rarity,
  );

  NamedAPIResource version;
  int rarity;

  factory PokemonHeldItemVersion.fromJson(Map<String, dynamic> json) =>
      _$PokemonHeldItemVersionFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonHeldItemVersionToJson(this);
}

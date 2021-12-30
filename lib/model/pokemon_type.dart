import 'package:json_annotation/json_annotation.dart';

import 'package:mixfunding/model/named_api_resource.dart';

part 'pokemon_type.g.dart';

@JsonSerializable()
class PokemonType {
  PokemonType(
    this.slot,
    this.type,
  );

  int slot;
  NamedAPIResource type;

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}

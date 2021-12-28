import 'package:json_annotation/json_annotation.dart';

import 'package:mixfunding/model/named_api_resource.dart';

part 'pokemon_ability.g.dart';

@JsonSerializable()
class PokemonAbility {
  PokemonAbility(
    this.is_hidden,
    this.slot,
    this.ability,
  );

  bool is_hidden;
  int slot;
  NamedAPIResource ability;

  factory PokemonAbility.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonAbilityToJson(this);
}

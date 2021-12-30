import 'package:json_annotation/json_annotation.dart';

import 'package:mixfunding/model/named_api_resource.dart';

part 'pokemon_stat.g.dart';

@JsonSerializable()
class PokemonStat {
  PokemonStat(
    this.stat,
    this.effort,
    this.base_stat,
  );

  NamedAPIResource stat;
  int effort;
  int base_stat;

  factory PokemonStat.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatToJson(this);
}

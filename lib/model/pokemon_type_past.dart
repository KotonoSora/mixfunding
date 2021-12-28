import 'package:json_annotation/json_annotation.dart';

import 'package:mixfunding/model/named_api_resource.dart';
import 'package:mixfunding/model/pokemon_type.dart';

part 'pokemon_type_past.g.dart';

@JsonSerializable()
class PokemonTypePast {
  PokemonTypePast(
    this.generation,
    this.types,
  );

  NamedAPIResource generation;
  List<PokemonType> types;

  factory PokemonTypePast.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypePastFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypePastToJson(this);
}

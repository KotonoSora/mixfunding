import 'package:json_annotation/json_annotation.dart';

import 'package:mixfunding/model/named_api_resource.dart';
import 'package:mixfunding/model/pokemon_move_version.dart';

part 'pokemon_move.g.dart';

@JsonSerializable()
class PokemonMove {
  PokemonMove(
    this.move,
    this.version_group_details,
  );

  NamedAPIResource move;
  List<PokemonMoveVersion> version_group_details;

  factory PokemonMove.fromJson(Map<String, dynamic> json) =>
      _$PokemonMoveFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonMoveToJson(this);
}

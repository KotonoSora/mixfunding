import 'package:json_annotation/json_annotation.dart';

import 'package:mixfunding/model/named_api_resource.dart';

part 'pokemon_move_version.g.dart';

@JsonSerializable()
class PokemonMoveVersion {
  PokemonMoveVersion(
    this.move_learn_method,
    this.version_group,
    this.level_learned_at,
  );

  NamedAPIResource move_learn_method;
  NamedAPIResource version_group;
  int level_learned_at;

  factory PokemonMoveVersion.fromJson(Map<String, dynamic> json) =>
      _$PokemonMoveVersionFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonMoveVersionToJson(this);
}

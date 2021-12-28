import 'package:json_annotation/json_annotation.dart';

import 'package:mixfunding/model/named_api_resource.dart';
import 'package:mixfunding/model/pokemon_help_item_version.dart';

part 'pokemon_help_item.g.dart';

@JsonSerializable()
class PokemonHeldItem {
  PokemonHeldItem(
    this.item,
    this.version_details,
  );

  NamedAPIResource item;
  PokemonHeldItemVersion version_details;

  factory PokemonHeldItem.fromJson(Map<String, dynamic> json) =>
      _$PokemonHeldItemFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonHeldItemToJson(this);
}

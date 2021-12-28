import 'package:json_annotation/json_annotation.dart';

import 'package:mixfunding/model/named_api_resource.dart';
import 'package:mixfunding/model/pokemon_ability.dart';
import 'package:mixfunding/model/version_game_index.dart';
import 'package:mixfunding/model/pokemon_help_item.dart';
import 'package:mixfunding/model/pokemon_move.dart';
import 'package:mixfunding/model/pokemon_type_past.dart';
import 'package:mixfunding/model/pokemon_sprites.dart';
import 'package:mixfunding/model/pokemon_stat.dart';
import 'package:mixfunding/model/pokemon_type.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  Pokemon(
    this.id,
    this.name,
    this.base_experience,
    this.height,
    this.is_default,
    this.order,
    this.weight,
    this.abilities,
    this.forms,
    this.game_indices,
    this.held_items,
    this.location_area_encounters,
    this.moves,
    this.past_types,
    this.sprites,
    this.species,
    this.stats,
    this.types,
  );

  int id;
  String name;
  int base_experience;
  int height;
  int is_default;
  int order;
  int weight;
  PokemonAbility abilities;
  List<NamedAPIResource> forms;
  VersionGameIndex game_indices;
  PokemonHeldItem held_items;
  String location_area_encounters;
  List<PokemonMove> moves;
  List<PokemonTypePast> past_types;
  PokemonSprites sprites;
  List<NamedAPIResource> species;
  List<PokemonStat> stats;
  List<PokemonType> types;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

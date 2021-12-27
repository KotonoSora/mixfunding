import 'package:json_annotation/json_annotation.dart';

import 'pokemon.dart';

part 'pokemons.g.dart';

@JsonSerializable()
class Pokemons {
  Pokemons(this.count, this.next, this.previous, this.results);

  int count;
  String? next;
  String? previous;
  List<Pokemon> results;

  factory Pokemons.fromJson(Map<String, dynamic> json) =>
      _$PokemonsFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonsToJson(this);
}

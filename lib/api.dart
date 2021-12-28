import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/pokemons.dart';
import 'model/berries.dart';

final String pokeApiv2 = 'https://pokeapi.co/api/v2/';
final String allPokemons = '${pokeApiv2}/pokemon';
final String allBerries = '${pokeApiv2}/berry';

class API {
  Future<Pokemons> getAllPokemon() {
    var url = Uri.parse(allPokemons);
    return http.get(url).then((response) =>
        Pokemons.fromJson(jsonDecode(response.body) as Map<String, dynamic>));
  }

  Future<Berries> getAllBerry() {
    var url = Uri.parse(allBerries);
    return http.get(url).then((response) =>
        Berries.fromJson(jsonDecode(response.body) as Map<String, dynamic>));
  }
}

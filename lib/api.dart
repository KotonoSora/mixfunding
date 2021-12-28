import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:mixfunding/model/pokemons.dart';
import 'package:mixfunding/model/berries.dart';

const String pokeApiv2 = 'https://pokeapi.co/api/v2';
const String allPokemons = '$pokeApiv2/pokemon';
const String allBerries = '$pokeApiv2/berry';

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

Future<Berries> getBerries(String url) {
  return http.get(Uri.parse(url)).then(
      (res) => Berries.fromJson(jsonDecode(res.body) as Map<String, dynamic>));
}

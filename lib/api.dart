import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:mixfunding/model/named_api_resource_list.dart';
import 'package:mixfunding/model/berry.dart';
import 'package:mixfunding/model/pokemon.dart';

const String pokeApiv2 = 'https://pokeapi.co/api/v2';
const String allPokemons = '$pokeApiv2/pokemon';
const String allBerries = '$pokeApiv2/berry';

Future<NamedAPIResourceList> getNamedResourceList(String url) {
  return http.get(Uri.parse(url)).then((res) => NamedAPIResourceList.fromJson(
      jsonDecode(res.body) as Map<String, dynamic>));
}

Future<Pokemon> getPokemonDetail(String url) {
  return http.get(Uri.parse(url)).then(
      (res) => Pokemon.fromJson(jsonDecode(res.body) as Map<String, dynamic>));
}

Future<Berry> getBerryDetail(String url) {
  return http.get(Uri.parse(url)).then(
      (res) => Berry.fromJson(jsonDecode(res.body) as Map<String, dynamic>));
}

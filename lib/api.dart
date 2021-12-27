import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/pokemons.dart';

final String pokeApiv2 = 'https://pokeapi.co/api/v2/';

class API {
  Future<Pokemons> getAllPokemon() {
    var url = Uri.parse("${pokeApiv2}/pokemon");
    return http.get(url).then((response) {
      return Pokemons.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    });
  }
}

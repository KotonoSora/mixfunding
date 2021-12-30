import 'package:flutter/material.dart';

import 'package:mixfunding/api.dart';
import 'package:mixfunding/model/pokemon.dart';

class SearchPokemon extends StatefulWidget {
  const SearchPokemon({Key? key}) : super(key: key);

  @override
  State<SearchPokemon> createState() => _SearchPokemonState();
}

class _SearchPokemonState extends State<SearchPokemon> {
  late TextEditingController _controller;
  Pokemon? _pokemon;
  bool _isNotFound = false;
  bool _isSearchRunning = false;

  void fetchPokemonDetail(String pokemonName) {
    setState(() {
      _isNotFound = false;
      _pokemon = null;
      _isSearchRunning = true;
    });
    getPokemonDetail('$allPokemons/$pokemonName').then((res) {
      setState(() {
        _pokemon = res;
        _isSearchRunning = false;
      });
    }).catchError((err) {
      setState(() {
        _isNotFound = true;
        _isSearchRunning = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Pokemon'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Id or name',
            ),
            onSubmitted: fetchPokemonDetail,
          ),
          if (_isSearchRunning == true)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (_isNotFound == true)
            Center(
              child: Text('Not found pokemon'),
            ),
          if (_pokemon != null)
            Image.network('${_pokemon?.sprites.front_default}'),
          if (_pokemon != null)
            Center(
              child: Text('Name: ${_pokemon?.name}'),
            ),
        ],
      ),
    );
  }
}

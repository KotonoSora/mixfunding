import 'package:flutter/material.dart';

import 'package:mixfunding/api.dart';
import 'package:mixfunding/model/pokemon.dart';

class SearchPokemon extends StatefulWidget {
  const SearchPokemon({Key? key}) : super(key: key);

  @override
  State<SearchPokemon> createState() => _SearchPokemonState();
}

class _SearchPokemonState extends State<SearchPokemon> {
  Pokemon? _pokemon;
  bool _isNotFound = false;
  bool _isSearchRunning = false;
  final _formKey = GlobalKey<FormState>();
  String _pokemonName = '';

  void fetchPokemonDetail() {
    setState(() {
      _isNotFound = false;
      _pokemon = null;
      _isSearchRunning = true;
    });
    getPokemonDetail('$allPokemons/$_pokemonName').then((res) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Pokemon'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_isSearchRunning == true)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              if (_isNotFound == true)
                Center(
                  child: Text('Not found pokemon'),
                ),
              if (_pokemon != null)
                Expanded(
                  child: Image.network('${_pokemon?.sprites.front_default}'),
                ),
              TextFormField(
                maxLines: 1,
                initialValue: _pokemonName,
                onChanged: (String name) {
                  setState(() {
                    _pokemonName = name;
                  });
                },
                validator: (String? name) {
                  if (name == null) {
                    return 'The name cannot be empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final isValid = _formKey.currentState!.validate();
                    if (!isValid) return;
                    fetchPokemonDetail();
                  },
                  child: Text('Search'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

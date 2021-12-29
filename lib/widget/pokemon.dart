import 'package:flutter/material.dart';
import 'package:mixfunding/api.dart';

import 'package:mixfunding/model/named_api_resource.dart';
import 'package:mixfunding/model/pokemon.dart';

class PokemonDetail extends StatefulWidget {
  const PokemonDetail({Key? key, required this.pokemon}) : super(key: key);

  final NamedAPIResource pokemon;

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  bool _isFirstLoadRunning = true;

  Pokemon? _pokemon;

  void _firstLoad() {
    setState(() {
      _isFirstLoadRunning = true;
    });
    getPokemonDetail(widget.pokemon.url).then((res) {
      setState(() {
        _pokemon = res;
        _isFirstLoadRunning = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _firstLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon detail'),
      ),
      body: _isFirstLoadRunning
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Text('Name: ${_pokemon?.name}'),
                if (_pokemon != null)
                  Image.network('${_pokemon?.sprites.front_default}')
              ],
            ),
    );
  }
}

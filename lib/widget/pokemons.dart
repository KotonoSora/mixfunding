import 'package:flutter/material.dart';

import 'package:mixfunding/model/named_api_resource.dart';
import 'package:mixfunding/api.dart';
import 'package:mixfunding/widget/pokemon.dart';

class PokemonsList extends StatefulWidget {
  const PokemonsList({Key? key}) : super(key: key);

  @override
  State<PokemonsList> createState() => _PokemonsListState();
}

class _PokemonsListState extends State<PokemonsList> {
  String _nextUrl = '';

  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;

  List<NamedAPIResource> _pokemons = [];

  void _firstLoad() {
    setState(() {
      _isFirstLoadRunning = true;
    });
    getNamedResourceList(allPokemons).then((res) {
      setState(() {
        _pokemons = res.results;
        _nextUrl = res.next ?? '';
        _isFirstLoadRunning = false;
      });
    });
  }

  void _loadMore() {
    if (_nextUrl.isEmpty) {
      setState(() {
        _isLoadMoreRunning = false;
      });
      return;
    }
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _nextUrl.isNotEmpty &&
        _controller.position.extentAfter < 500) {
      setState(() {
        _isLoadMoreRunning = true;
      });
      if (_nextUrl.isNotEmpty) {
        getNamedResourceList(_nextUrl).then((res) {
          if (res.results.isNotEmpty) {
            setState(() {
              _pokemons.addAll(res.results);
              _nextUrl = res.next ?? '';
            });
          } else {
            setState(() {
              _hasNextPage = false;
            });
          }
          setState(() {
            _isLoadMoreRunning = false;
          });
        });
      }
    }
  }

  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berries List'),
      ),
      body: _isFirstLoadRunning
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: _pokemons.length,
                    itemBuilder: (_, int index) => Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 10,
                      ),
                      child: ListTile(
                        title: Text(_pokemons[index].name),
                        subtitle: Text(_pokemons[index].url),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PokemonDetail(
                              pokemon: _pokemons[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (_isLoadMoreRunning == true)
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 40,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (_hasNextPage == false)
                  Container(
                    padding: const EdgeInsets.only(
                      top: 30,
                      bottom: 40,
                    ),
                    color: Colors.amber,
                    child: const Center(
                      child: Text('fetched all berries'),
                    ),
                  ),
              ],
            ),
    );
  }
}

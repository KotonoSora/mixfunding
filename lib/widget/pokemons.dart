import 'package:flutter/material.dart';

import 'package:mixfunding/model/named_api_resource.dart';
import 'package:mixfunding/api.dart';
import 'package:mixfunding/widget/pokemon.dart';
import 'package:mixfunding/pub/infinite_list.dart';

class PokemonsList extends StatefulWidget {
  const PokemonsList({Key? key}) : super(key: key);

  @override
  State<PokemonsList> createState() => _PokemonsListState();
}

class _PokemonsListState extends State<PokemonsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemons"),
      ),
      body: InfiniteList<NamedAPIResource>(
        builder: (BuildContext context, List<NamedAPIResource> items,
                ScrollController scrollController) =>
            ListView.builder(
          controller: scrollController,
          itemCount: items.length,
          itemBuilder: (_, int index) => Card(
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 10,
            ),
            child: ListTile(
              title: Text(items[index].name),
              subtitle: Text(items[index].url),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PokemonDetail(
                    pokemon: items[index],
                  ),
                ),
              ),
            ),
          ),
        ),
        placeholderBuilder: (BuildContext context) => Container(),
        onMoreItemsRequested: () {},
        fetcher: () =>
            getNamedResourceList(allPokemons).then((res) => res.results),
        moreItemsfetcher: () =>
            getNamedResourceList(allPokemons).then((res) => res.results),
        footerBuilder: (context) => Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

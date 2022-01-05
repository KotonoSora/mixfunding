import 'package:flutter/material.dart';

import 'package:mixfunding/widget/pokemons.dart';
import 'package:mixfunding/widget/berries.dart';
import 'package:mixfunding/widget/todo.dart';
import 'package:mixfunding/widget/search_pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PokemonsList(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          switch (index) {
            case 1:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BerriesList(),
                ),
              );
              break;
            case 2:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => Todo(),
                ),
              );
              break;
            case 3:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => SearchPokemon(),
                ),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Pokemons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.approval_rounded),
            label: 'Berries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Todolist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}

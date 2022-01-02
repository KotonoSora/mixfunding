import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:mixfunding/widget/berries.dart';
import 'package:mixfunding/widget/pokemons.dart';
// import 'package:mixfunding/widget/search_pokemon.dart';
// import 'package:mixfunding/widget/todo.dart';
import 'package:mixfunding/provider/todos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        title: 'mixfunding',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PokemonsList(),
      ),
    );
  }
}

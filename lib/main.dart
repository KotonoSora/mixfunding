import 'package:flutter/material.dart';

import 'package:mixfunding/widget/berries.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mixfunding',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BerriesList(),
    );
  }
}

import 'my_bottom_navigation.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyPokemonApp());
}

class MyPokemonApp extends StatefulWidget {
  const MyPokemonApp({super.key});

  @override
  State<MyPokemonApp> createState() => _MyPokemonAppState();
}

class _MyPokemonAppState extends State<MyPokemonApp> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PokemonService(),
      child: const PokemonTheme(),
    );
  }
}

// pokemon theme class for set theme with pokemonService provider
class PokemonTheme extends StatefulWidget {
  const PokemonTheme({Key? key}) : super(key: key);

  @override
  State<PokemonTheme> createState() => _PokemonThemeState();
}

class _PokemonThemeState extends State<PokemonTheme> {
  // colors shade for mapping
  Map<int, Color> color = {
    50: const Color.fromRGBO(136, 14, 79, .1),
    100: const Color.fromRGBO(136, 14, 79, .2),
    200: const Color.fromRGBO(136, 14, 79, .3),
    300: const Color.fromRGBO(136, 14, 79, .4),
    400: const Color.fromRGBO(136, 14, 79, .5),
    500: const Color.fromRGBO(136, 14, 79, .6),
    600: const Color.fromRGBO(136, 14, 79, .7),
    700: const Color.fromRGBO(136, 14, 79, .8),
    800: const Color.fromRGBO(136, 14, 79, .9),
    900: const Color.fromRGBO(136, 14, 79, 1),
  };

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonService>(builder: (_, pokemonService, __) {
    return MaterialApp(
      title: 'Pokemon Demo',
      debugShowCheckedModeBanner: false,
      // set theme follow to pokemonService color
      theme:  ThemeData(
        primarySwatch: MaterialColor(pokemonService.getColor(), color),
      ),
      home: const MyBottomNavigation(),
    );
  });
  }
}

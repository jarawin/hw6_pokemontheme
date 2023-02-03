import 'pokemon_api.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  int focusIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonService>(builder: (_, pokemonService, __) {
      return Scaffold(
        appBar: AppBar(
          title:
              const Text('Pokemon List', style: TextStyle(color: Colors.white)),
        ),
        body: GridView.builder(
          itemCount: pokemonService.pokemonCount,
          itemBuilder: (BuildContext context, int index) {
            // return PokemonEach(pokemonIndex: index,);
            return GestureDetector(
                onTap: () {
                  setState(() {
                    focusIndex = index;
                    pokemonService.changePokemonIndex(index);
                  });
                }, // Image tapped
                child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: focusIndex == index ? BoxDecoration(
                        border: Border.all(color: Colors.black, width: 5)) : null,
                    child: Image.network(genPokemonImageUrl(index + 1))));
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
        ),
      );
    });
  }
}

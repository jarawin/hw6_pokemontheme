import 'package:flutter/material.dart';
import 'package:cs311hw06/pokemon_api.dart';

class PokemonService extends ChangeNotifier {
  int pokemonCount = 1;

  void changePokemonCount(int value) {
    pokemonCount += value;

    if (pokemonCount < 0) {
      pokemonCount = 0;
    }
    notifyListeners();
  }

  // variable for set default the color and pokemon type
  String pokemonType = "grass";
  int color = 0xFF7AC74C;

  // getter for get color to primarySwatch
  int getColor() => color;

  // function for set pokemon index and fetch pokemon info
  // and map the pokemon type to color
  void changePokemonIndex(int index) async {
    // fetch data pokemon info
    var res = await fetchPokemonInfo(index+1);
    pokemonType = res.types[0].toLowerCase();

    // map type to color
    switch(pokemonType){
      case "normal" :
        {
          color = 0xFFA8A77A;
        }
        break;
      case "fire" :
        {
          color = 0xFFEE8130;
        }
        break;
      case "water" :
        {
          color = 0xFF6390F0;
        }
        break;
      case "electric" :
        {
          color = 0xFFF7D02C;
        }
        break;
      case "grass" :
        {
          color = 0xFF7AC74C;
        }
        break;
      case "ice" :
        {
          color = 0xFF96D9D6;
        }
        break;
      case "fighting" :
        {
          color = 0xFFC22E28;
        }
        break;
      case "poison" :
        {
          color = 0xFFA33EA1;
        }
        break;
      case "ground" :
        {
          color = 0xFFE2BF65;
        }
        break;
      case "flying" :
        {
          color = 0xFFA98FF3;
        }
        break;
      case "psychic" :
        {
          color = 0xFFF95587;
        }
        break;
      case "bug" :
        {
          color = 0xFFA6B91A;
        }
        break;
      case "rock" :
        {
          color = 0xFFB6A136;
        }
        break;
      case "ghost" :
        {
          color = 0xFF735797;
        }
        break;
      case "dragon" :
        {
          color = 0xFF6F35FC;
        }
        break;
      case "dark" :
        {
          color = 0xFF705746;
        }
        break;
      case "steel" :
        {
          color = 0xFFB7B7CE;
        }
        break;
      case "fairy" :
        {
          color = 0xFFD685AD;
        }
        break;
      default: {
        color = 0xFF7AC74C;
      }
      break;
    }
    notifyListeners();
  }
}

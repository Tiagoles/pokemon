import 'dart:convert';

import 'package:treinamento_flutter/app/data/models/pokemon/database_models/pokemon_local_model.dart';
import 'package:treinamento_flutter/app/data/models/pokemon/pokemon_pokeapi/pokemon_pokeapi_model.dart';

class Pokemon {
  final int number;
  final String name;
  final String type;
  final List<String> types;
  final String? photo;
  final String species;
  final int height;
  final int weight;
  final List<String> abilities;

  Pokemon({
    required this.number,
    required this.name,
    required this.type,
    required this.types,
    this.photo,
    required this.species,
    required this.height,
    required this.weight,
    required this.abilities
  });

  factory Pokemon.fromPokeApiModel(PokemonPokeapiModel model){
    return Pokemon(
      height: model.height,
      weight: model.weight,
      number: model.id,
      name: model.name,
      type: model.types.isNotEmpty ? model.types.first.type.name : "Desconhecido",
      types: model.types.map((e) => e.type.name).toList(),
      photo: model.sprites.other?.dreamWorld?.frontDefault,
      species: model.species.name,
      abilities: model.abilities.map((e) => e.ability.name).toList()
    );
  }
  
  factory Pokemon.fromPokemonLocalModel(PokemonLocalModel model){
    return Pokemon(
      height: model.height,
      weight: model.weight,
      number: model.number,
      name: model.name,
      type: model.type,
      types: List<String>.from(json.decode(model.types)),
      photo: model.photo,
      species: model.species,
      abilities: List<String>.from(json.decode(model.abilities))
    );
  }

}
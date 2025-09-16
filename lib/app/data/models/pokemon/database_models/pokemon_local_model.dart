import 'dart:convert';

import 'package:objectbox/objectbox.dart';
import 'package:treinamento_flutter/app/domain/entities/pokemon/pokemon.dart';

@Entity()
class PokemonLocalModel {
  @Id()
  int id;
  @Unique(onConflict: ConflictStrategy.replace)
  final int number;
  final String name;
  final String type;
  //Converta a array para uma string json
  final String types;
  final String? photo;
  final String species;
  final int height;
  final int weight;
  //Converta a array para uma string json
  final String abilities;

  PokemonLocalModel({
    this.id = 0,
    required this.number,
    required this.name,
    required this.type,
    required this.types,
    required this.photo,
    required this.species,
    required this.height,
    required this.weight,
    required this.abilities
  });

  factory PokemonLocalModel.fromPokemon(Pokemon entity){
    return PokemonLocalModel(
      number: entity.number,
      name: entity.name,
      type: entity.type,
      types: json.encode(entity.types),
      photo: entity.photo,
      species: entity.species,
      height: entity.height,
      weight: entity.weight,
      abilities: json.encode(entity.abilities)
    );
  }

}
import 'dart:convert';

import 'package:objectbox/objectbox.dart';

import '../../../domain/entities/pokemon/pokemon.dart';

@Entity()
class DbPokemon {
  @Id()
  int id;
  @Unique(onConflict: ConflictStrategy.replace)
  final int number;
  final String name;
  final String type;
  final String types;
  final String? photo;
  final String species;
  final int height;
  final int weight;
  final String abilities;

  DbPokemon({
    this.id = 0,
    required this.number,
    required this.name,
    required this.type,
    required this.types,
    required this.photo,
    required this.species,
    required this.height,
    required this.weight,
    required this.abilities,
  });

  factory DbPokemon.fromPokemon(Pokemon entity) {
    return DbPokemon(
      number: entity.number,
      name: entity.name,
      type: entity.type,
      types: json.encode(entity.types),
      photo: entity.photo,
      species: entity.species,
      height: entity.height,
      weight: entity.weight,
      abilities: json.encode(entity.abilities),
    );
  }

  Pokemon toEntity() {
    return Pokemon(
      number: number,
      name: name,
      type: type,
      types: List<String>.from(json.decode(types)),
      photo: photo,
      species: species,
      height: height,
      weight: weight,
      abilities: List<String>.from(json.decode(abilities)),
    );
  }
}

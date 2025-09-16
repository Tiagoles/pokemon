import 'package:treinamento_flutter/app/domain/entities/pokemon/pokemon.dart';

class PokemonList{
  final List<Pokemon> pokemons;
  final String? next;
  final String? prev;

  PokemonList({
    required this.pokemons,
    this.next,
    this.prev
  });
}
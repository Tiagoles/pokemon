import 'package:result_dart/result_dart.dart';

import '../../data/repositories/pokemon/pokemon_local_repository.dart';
import '../../data/repositories/pokemon/pokemon_repository.dart';
import '../entities/pokemon/pokemon.dart';

class SyncPokemons {
  final PokemonRepository _repository;
  final PokemonLocalRepository _pokemonLocalRepository;

  SyncPokemons(this._repository, this._pokemonLocalRepository);

  AsyncResult<List<Pokemon>> call() async {
    return _repository
        .getAllByFilter()
        .flatMap((list) => _pokemonLocalRepository.clear().pure(list))
        .flatMap((list) => _pokemonLocalRepository.putAll(list));
  }
}

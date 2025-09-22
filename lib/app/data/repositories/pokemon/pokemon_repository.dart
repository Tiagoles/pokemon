import 'package:result_dart/result_dart.dart';
import 'package:treinamento_flutter/app/data/repositories/pokemon/pokemon_local_repository.dart';
import 'package:treinamento_flutter/app/data/services/pokemon/pokemon_service.dart';

import '../../../domain/entities/pokemon/pokemon.dart';

class PokemonRepository {
  final PokemonService _service;
  final PokemonLocalRepository _pokemonLocalRepository;

  PokemonRepository(this._service, this._pokemonLocalRepository);

  AsyncResult<List<Pokemon>> getAllByFilter() async {
    return _service.getAll().flatMap((resp) async {
      final references = resp.results;
      final (next, prev) = (resp.next, resp.previous);
      final pokemons = <Pokemon>[];
      for (final reference in references) {
        final result = await getByUrl(reference.url);
        if (result.isError()) return Failure(result.exceptionOrNull()!);
        pokemons.add(result.getOrNull()!);
      }
      return Success(pokemons);
    });
  }

  AsyncResult<Pokemon> getByUrl(String url) async {
    return _service.getByUrl(url).map((r) => Pokemon.fromPokeApiModel(r));
  }
}

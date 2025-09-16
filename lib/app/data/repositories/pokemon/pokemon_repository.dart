import 'package:result_dart/result_dart.dart';
import 'package:treinamento_flutter/app/data/services/pokemon/pokemon_service.dart';
import 'package:treinamento_flutter/app/domain/entities/pokemon/pokemon.dart';
import 'package:treinamento_flutter/app/data/models/pokemon/pokemon_list.dart';

class PokemonRepository {

  final PokemonService _service;

  PokemonRepository(this._service);

  AsyncResult<PokemonList> getAllByFilter({int limit = 9999, int offset = 0}) async {
    return _service.getReferenceList(limit: limit,offset: offset).flatMap((resp) async {
      final references = resp.results;
      final (next, prev) = (resp.next, resp.previous);
      final pokemons = <Pokemon>[];
      for (final reference in references) {
        final result = await getByUrl(reference.url);
        if (result.isError()) return Failure(result.exceptionOrNull()!);
        pokemons.add(result.getOrNull()!);
      }
      return Success(PokemonList(pokemons: pokemons, next: next, prev: prev));
    });
  }

  AsyncResult<Pokemon> getByUrl(String url) async {
    return _service.getByUrl(url).map((r) => Pokemon.fromPokeApiModel(r));
  }

  AsyncResult<int> getQtdPokemons() async {
    return _service.getQtdPokemons();
  }

}
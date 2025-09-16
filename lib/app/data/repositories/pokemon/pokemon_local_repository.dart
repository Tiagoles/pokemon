import 'package:result_dart/result_dart.dart';
import 'package:treinamento_flutter/app/data/models/objectbox/objectbox.g.dart';
import 'package:treinamento_flutter/app/data/models/pokemon/database_models/pokemon_local_filter_model.dart';
import 'package:treinamento_flutter/app/data/models/pokemon/database_models/pokemon_local_model.dart';
import 'package:treinamento_flutter/app/data/services/pokemon/pokemon_local_service.dart';
import 'package:treinamento_flutter/app/domain/entities/pokemon/pokemon.dart';

class PokemonLocalRepository{

  final PokemonLocalService _service;

  PokemonLocalRepository(this._service);

  AsyncResult<List<Pokemon>> getAll(PokemonLocalFilterModel? filter) async {
    return _service.getAll(filter)
      .map((model) => model
      .map((e) => Pokemon.fromPokemonLocalModel(e)).toList());
  }

  AsyncResult<Stream<List<Pokemon>>> watch([PokemonLocalFilterModel? filter]) async {
    return _service.filterQuery(filter)
        .map((q) => q.order(PokemonLocalModel_.number).watch(triggerImmediately: true)
        .map((q) => q.find())
        .map((list) => list
        .map((e) => Pokemon.fromPokemonLocalModel(e)).toList()));
  }

  AsyncResult<Pokemon> save(Pokemon pokemon) async {
    return _service.save(PokemonLocalModel.fromPokemon(pokemon))
      .map((model) => Pokemon.fromPokemonLocalModel(model));
  }

  AsyncResult<List<Pokemon>> saveAll(List<Pokemon> list) async {
    return _service.saveAll(list.map((e) => PokemonLocalModel.fromPokemon(e)).toList())
      .map((ls) => ls.map((e) => Pokemon.fromPokemonLocalModel(e)).toList());
  }

  Result<int> getQtdPokemons() {
    return _service.getQtdPokemons();
  }

}
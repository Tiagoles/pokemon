import 'package:result_dart/result_dart.dart';
import 'package:rxdart/rxdart.dart';
import 'package:treinamento_flutter/app/data/models/objectbox/objectbox.g.dart';
import 'package:treinamento_flutter/app/data/models/pokemon/db_pokemon.dart';

import '../../../domain/entities/pokemon/pokemon.dart';
import '../../models/pokemon/database/pokemon_local_filter_model.dart';
import '../../services/pokemon/pokemon_local_service.dart';

class PokemonLocalRepository {
  final PokemonLocalService _service;

  PokemonLocalRepository(this._service);

  AsyncResult<List<Pokemon>> getAll(PokemonLocalFilterModel? filter) async {
    return _service
        .getAll(filter)
        .map(
          (model) =>
              model.map((e) => Pokemon.fromPokemonLocalModel(e)).toList(),
        );
  }

  AsyncResult<List<Pokemon>> putAll(List<Pokemon> pokemons) async {
    return _service
        .putAndGetMany(pokemons.map((e) => DbPokemon.fromPokemon(e)).toList())
        .map((model) => model.map((e) => e.toEntity()).toList());
  }

  AsyncResult<Unit> clear() async {
    return _service.clear();
  }

  AsyncResult<Stream<List<Pokemon>>> watch([
    PokemonLocalFilterModel? filter,
  ]) async {
    return _service
        .filterQuery(filter)
        .map(
          (q) => q
              .order(DbPokemon_.number)
              .watch(triggerImmediately: true)
              .map((q) => q.find())
              .map((list) => list.map((e) => e.toEntity()).toList()),
        );
  }
}

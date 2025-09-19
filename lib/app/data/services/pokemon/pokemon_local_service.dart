import 'package:result_dart/result_dart.dart';
import 'package:treinamento_flutter/app/data/models/pokemon/db_pokemon.dart';
import '../../../domain/entities/pokemon/pokemon.dart';
import '../../models/objectbox/objectbox.g.dart';
import '../../models/pokemon/database/pokemon_local_filter_model.dart';
import '../core/database_service.dart';

class PokemonLocalService {
  final DatabaseService _databaseService;

  PokemonLocalService(this._databaseService);

  AsyncResult<List<DbPokemon>> getAll(PokemonLocalFilterModel? filter) async {
    return filterQuery(
      filter,
    ).map((query) => query.order(DbPokemon_.number).build().findAsync());
  }

  AsyncResult<QueryBuilder<DbPokemon>> filterQuery(
    PokemonLocalFilterModel? filter,
  ) async {
    var conditions = DbPokemon_.id.notNull();
    if (filter != null) {
      if (filter.id != null) {
        conditions = conditions.and(DbPokemon_.id.equals(filter.id!));
      }
      if (filter.name != null) {
        conditions = conditions.and(
          DbPokemon_.name.contains(filter.name!, caseSensitive: false),
        );
      }
    }
    return _databaseService.query<DbPokemon>(conditions);
  }

  AsyncResult<Unit> clear() async {
    return _databaseService.reset<DbPokemon>();
  }

  AsyncResult<List<DbPokemon>> putAndGetMany(List<DbPokemon> pokemons) async {
    return _databaseService.putAndGetMany<DbPokemon>(pokemons);
  }
}

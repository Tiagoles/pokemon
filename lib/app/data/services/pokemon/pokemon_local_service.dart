import 'package:result_dart/result_dart.dart';
import 'package:treinamento_flutter/app/data/exceptions/core_exceptions.dart';
import 'package:treinamento_flutter/app/data/models/objectbox/objectbox.g.dart';
import 'package:treinamento_flutter/app/data/models/pokemon/database_models/pokemon_local_filter_model.dart';
import 'package:treinamento_flutter/app/data/models/pokemon/database_models/pokemon_local_model.dart';
import 'package:treinamento_flutter/app/data/services/core/database_service.dart';

class PokemonLocalService{

  final DatabaseService _databaseService;

  PokemonLocalService(this._databaseService);

  AsyncResult<List<PokemonLocalModel>> getAll(PokemonLocalFilterModel? filter) async {
    return filterQuery(filter).map((query) => query.order(PokemonLocalModel_.number).build().findAsync());
  }

  AsyncResult<QueryBuilder<PokemonLocalModel>> filterQuery(PokemonLocalFilterModel? filter) async {
    var conditions = PokemonLocalModel_.id.notNull();
    if(filter != null){
      if(filter.id != null){
        conditions = conditions.and(PokemonLocalModel_.id.equals(filter.id!));
      }
      if(filter.name != null){
        conditions = conditions.and(PokemonLocalModel_.name.contains(filter.name!, caseSensitive: false));
      }
    }
    return _databaseService.query<PokemonLocalModel>(conditions);
  }

  AsyncResult<PokemonLocalModel> save(PokemonLocalModel model) async {
    return _databaseService.put<PokemonLocalModel>(model);
  }

  AsyncResult<List<PokemonLocalModel>> saveAll(List<PokemonLocalModel> list) async {
    return _databaseService.putAndGetMany<PokemonLocalModel>(list);
  }

  Result<int> getQtdPokemons() {
    try{
      return Success(_databaseService.getBox<PokemonLocalModel>().count());
    } on ObjectBoxException catch (e, s) {
      return Failure(LocalDatabaseException(e.message, s));
    }
  }
  
}
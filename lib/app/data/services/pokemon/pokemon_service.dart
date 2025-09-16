import 'dart:isolate';
import 'package:result_dart/result_dart.dart';
import 'package:treinamento_flutter/app/data/models/pokemon/pokeapi_list_result/pokeapi_list_result_model.dart';
import 'package:treinamento_flutter/app/data/models/pokemon/pokemon_pokeapi/pokemon_pokeapi_model.dart';
import 'package:treinamento_flutter/app/data/services/core/clients/client_http.dart';

class PokemonService {

  final ClientHttp _client;

  PokemonService(this._client);

  AsyncResult<PokeapiListResultModel> getReferenceList({required int limit, required int offset}) async {
    final response = await _client.get('/pokemon',
      queryParameters: {
        'limit': limit,
        'offset': offset
      }
    );

    return Isolate.run(() => response
      .map((resp) => PokeapiListResultModel.fromJson(resp.data))
    );

  }

  AsyncResult<PokemonPokeapiModel> getByUrl(String url) async {

    final response = await _client.get(url);
    return Isolate.run(() => response
      .map((resp) => PokemonPokeapiModel.fromJson(resp.data))
    );

  }

  AsyncResult<int> getQtdPokemons() async {

    final response = await _client.get('/pokemon',
        queryParameters: {
          'limit': 10,
          'offset': 0
        }
    );

    return Isolate.run(() => response
      .map((resp) => PokeapiListResultModel.fromJson(resp.data).count)
    );

  }

}


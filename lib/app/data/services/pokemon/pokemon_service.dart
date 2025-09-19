import 'dart:isolate';

import 'package:result_dart/result_dart.dart';
import 'package:treinamento_flutter/app/data/services/core/clients/client_http.dart';

import '../../models/pokeapi_list/pokeapi_list_model.dart';
import '../../models/pokemon_pokeapi/pokemon_pokeapi.dart';

class PokemonService {
  final ClientHttp _clientHttp;

  PokemonService(this._clientHttp);

  AsyncResult<PokeApiListModel> getAll() async {
    final response = await _clientHttp.get(
      'pokeapi_list',
      queryParameters: {'offset': 0, 'limit': 9999},
    );
    return Isolate.run(
      () => response.map((resp) => PokeApiListModel.fromJson(resp.data)),
    );
  }

  AsyncResult<PokemonPokeapiModel> getByUrl(String url) async {
    final response = await _clientHttp.get(url);
    return Isolate.run(
      () => response.map((resp) => PokemonPokeapiModel.fromJson(resp.data)),
    );
  }
}

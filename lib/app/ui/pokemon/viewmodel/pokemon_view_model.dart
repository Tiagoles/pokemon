import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:result_dart/result_dart.dart';
import 'package:treinamento_flutter/app/data/repositories/pokemon/pokemon_local_repository.dart';
import '../../../data/repositories/pokemon/pokemon_repository.dart';
import '../../../data/services/core/connectivity_service.dart';
import '../../../domain/entities/pokemon/pokemon.dart';
import '../../../domain/usecase/sync_pokemons.dart';
import '../../../utils/command.dart';

class PokemonViewModel {
  final PokemonRepository _pokemonRepository;
  final SyncPokemons _syncPokemons;
  final PokemonLocalRepository _pokemonLocalRepository;
  final ConnectivityService _connectivityService;
  late final Command0<List<Pokemon>> syncCommand;
  late final StreamSubscription? _subscription;
  final pokemons = ValueNotifier<List<Pokemon>>([]);

  PokemonViewModel(
    this._pokemonLocalRepository,
    this._pokemonRepository,
    this._connectivityService,
    this._syncPokemons,
  ) {
    syncCommand = Command0(_syncPokemons.call);
    syncCommand.execute();
    _pokemonLocalRepository.watch().onSuccess((stream) {
      _subscription = stream.listen((data) {
        pokemons.value = data;
      });
    });
    // fetchNextPageCommand = Command0(fetchNextPage)
    // if(fetchNextPageCommand.value.isEmpty) {
    //   fetchNextPageCommand.execute();
    // }
  }

  final state = ValueNotifier(PagingState<int, Pokemon>());
  // AsyncResult<List<Pokemon>> fetchNextPage() async {
  //   state.value = state.value.copyWith(isLoading: true, error: null );
  // }
}

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:result_dart/result_dart.dart';
import 'package:treinamento_flutter/app/data/repositories/pokemon/pokemon_local_repository.dart';
import 'package:treinamento_flutter/app/data/repositories/pokemon/pokemon_repository.dart';
import 'package:treinamento_flutter/app/data/services/core/connectivity_service.dart';
import 'package:treinamento_flutter/app/domain/entities/pokemon/pokemon.dart';
import 'package:treinamento_flutter/app/domain/exceptions/pokemon_exception.dart';
import 'package:treinamento_flutter/app/utils/command.dart';

const _limit = 10;

class PokemonViewModel implements Disposable{

  final PokemonRepository _remoteRepository;
  final PokemonLocalRepository _localRepository;
  final ConnectivityService _connectivityService;
  late final Command0<List<Pokemon>> fetchNextPageCommand;
  late final StreamSubscription? _subscription;

  final pokemons = ValueNotifier<List<Pokemon>>([]);
  final filteredPokemons = ValueNotifier<List<Pokemon>>([]);

  PokemonViewModel(
    this._remoteRepository,
    this._localRepository,
    this._connectivityService
  ) {

    _localRepository.watch()
    .onSuccess((stream){
      _subscription = stream.listen((data){
        pokemons.value = data;
        filter();
      });
    });

    fetchNextPageCommand = Command0(fetchNextPage);

    if(pokemons.value.isEmpty) fetchNextPageCommand.execute();

  }

  void filter([String? filter]) {
    final query = filter?.trim().toLowerCase();
    if (query == null || query.isEmpty) {
      filteredPokemons.value = List<Pokemon>.from(pokemons.value);
    } else {
      filteredPokemons.value = pokemons.value
          .where((p) => p.name.toLowerCase().contains(query))
          .toList();
    }

    state.value = PagingState<int, Pokemon>();

    loadState();
  }


  AsyncResult<List<Pokemon>> fetchNextPage() async {
    state.value = state.value.copyWith(isLoading: true, error: null);
    return _connectivityService.isConnected().flatMap((isConnected) async {
      if(isConnected){
        final result = await _remoteRepository.getAllByFilter(
          limit: _limit,
          offset: state.value.keys?.last ?? 0
        ).map((res) => res.pokemons).flatMap(_localRepository.saveAll);
        loadState();
        return result;
      }
      return Failure(SocketException('Verifique sua conexão com a internet e tente novamente.'));
    });
  }

  final state = ValueNotifier(PagingState<int, Pokemon>());

  void loadState() {
    if (filteredPokemons.value.isEmpty) {
      state.value = state.value.copyWith(
        error: PokemonException('Nenhum Pokémon encontrado.'),
        isLoading: false,
        hasNextPage: false,
      );
      return;
    }

    state.value = state.value.copyWith(
      error: null,
      isLoading: true,
    );

    final lastKey = state.value.keys?.last ?? 0;

    if (lastKey >= filteredPokemons.value.length) {
      // Não há mais páginas
      state.value = state.value.copyWith(
        isLoading: false,
        hasNextPage: false,
      );
      return;
    }

    // Aqui está o ponto importante
    final end = (lastKey + _limit).clamp(
      0,
      filteredPokemons.value.length,
    );

    final result = filteredPokemons.value.sublist(lastKey, end);

    state.value = state.value.copyWith(
      pages: [...?state.value.pages, result],
      keys: [...?state.value.keys, end],
      hasNextPage: end < filteredPokemons.value.length,
      isLoading: false,
    );
  }


  @override
  void dispose() {
    fetchNextPageCommand.dispose();
    pokemons.dispose();
    filteredPokemons.dispose();
    state.dispose();
    _subscription?.cancel();
  }

}
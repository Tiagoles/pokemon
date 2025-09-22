import 'package:flutter_modular/flutter_modular.dart';
import 'package:treinamento_flutter/app/data/repositories/pokemon/pokemon_local_repository.dart';
import 'package:treinamento_flutter/app/data/repositories/pokemon/pokemon_repository.dart';
import 'package:treinamento_flutter/app/data/services/pokemon/pokemon_local_service.dart';
import 'package:treinamento_flutter/app/data/services/pokemon/pokemon_service.dart';
import 'package:treinamento_flutter/app/domain/usecase/sync_pokemons.dart';
import 'package:treinamento_flutter/app/ui/pokemon/viewmodel/pokemon_view_model.dart';

import 'core_module.dart';

class PokemonModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void exportedBinds(Injector i) {
    i.addSingleton(PokemonViewModel.new);
  }

  @override
  void binds(Injector i) {
    i.add(PokemonService.new);
    i.add(PokemonLocalService.new);
    i.add(PokemonLocalRepository.new);
    i.add(PokemonRepository.new);
    i.add(SyncPokemons.new);
  }
}

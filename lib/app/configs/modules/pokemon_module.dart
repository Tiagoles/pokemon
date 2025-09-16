import 'package:flutter_modular/flutter_modular.dart';
import 'package:treinamento_flutter/app/configs/modules/core_module.dart';
import 'package:treinamento_flutter/app/data/repositories/pokemon/pokemon_local_repository.dart';
import 'package:treinamento_flutter/app/data/repositories/pokemon/pokemon_repository.dart';
import 'package:treinamento_flutter/app/data/services/core/clients/client_http.dart';
import 'package:treinamento_flutter/app/data/services/pokemon/pokemon_local_service.dart';
import 'package:treinamento_flutter/app/data/services/pokemon/pokemon_service.dart';
import 'package:treinamento_flutter/app/ui/pokemon/viewmodel/pokemon_viewmodel.dart';

class PokemonModule extends Module {

  @override
  List<Module> get imports => [
    CoreModule()
  ];

  @override
  void exportedBinds(Injector i) {
    i.addSingleton(PokemonViewModel.new);
  }

  @override
  void binds(Injector i) {
    i.add<PokemonService>(() => PokemonService(i.get<ClientHttp>()));
    i.add<PokemonLocalService>(PokemonLocalService.new);
    i.add<PokemonRepository>(PokemonRepository.new);
    i.add<PokemonLocalRepository>(PokemonLocalRepository.new);
  }

}
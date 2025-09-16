import 'package:flutter_modular/flutter_modular.dart';
import 'package:treinamento_flutter/app/configs/modules/core_module.dart';
import 'package:treinamento_flutter/app/configs/modules/pokemon_module.dart';
import 'package:treinamento_flutter/app/ui/home/widgets/home_page.dart';

class HomeModule extends Module {

  @override
  List<Module> get imports => [
    CoreModule(),
    PokemonModule()
  ];

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => HomePage(
      queryParams: r.args.queryParams,
      pokemonViewModel: Modular.get(),
    ));
  }

}
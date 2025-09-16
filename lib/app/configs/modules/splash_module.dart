import 'package:flutter_modular/flutter_modular.dart';
import 'package:treinamento_flutter/app/configs/modules/core_module.dart';
import 'package:treinamento_flutter/app/ui/splash/splash_page.dart';
import 'package:treinamento_flutter/app/ui/splash/viewmodels/splash_viewmodel.dart';

class SplashModule extends Module{

  @override
  List<Module> get imports => [
    CoreModule()
  ];

  @override
  void binds(Injector i) {
    i.add<SplashViewModel>(SplashViewModel.new);
  }
  
  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => SplashPage(viewModel: Modular.get()));
  }

}
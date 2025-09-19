import 'package:flutter_modular/flutter_modular.dart';
import 'package:treinamento_flutter/app/configs/modules/core_module.dart';
import 'package:treinamento_flutter/app/configs/modules/home_module.dart';
import 'package:treinamento_flutter/app/configs/modules/splash_module.dart';

class AppModule extends Module {
  AppModule();

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: SplashModule());
    r.module('/home', module: HomeModule());
  }
}

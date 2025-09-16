import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:treinamento_flutter/app/data/repositories/core/theme_repository.dart';
import 'package:treinamento_flutter/app/data/services/core/clients/client_http.dart';
import 'package:treinamento_flutter/app/data/services/core/connectivity_service.dart';
import 'package:treinamento_flutter/app/data/services/core/database_service.dart';
import 'package:treinamento_flutter/app/data/services/core/local_storage/secure_storage.dart';
import 'package:treinamento_flutter/app/data/services/core/local_storage/shared_preferences_storage.dart';
import 'package:treinamento_flutter/app/data/services/core/theme_storage.dart';
import 'package:treinamento_flutter/app/ui/core/viewmodels/theme_viewmodel.dart';

class CoreModule extends Module {

  @override
  void exportedBinds(Injector i) {
    i.addSingleton(DatabaseService.new);
    i.add(FlutterSecureStorage.new);
    i.add(SharedPreferencesStorage.new);
    i.add(SecureStorage.new);
    i.addSingleton(Connectivity.new);
    i.addSingleton(ConnectivityService.new);
    i.addSingleton(HttpClient.new);
    i.addSingleton(BaseOptions.new);
    i.addSingleton(() => Dio(i.get<BaseOptions>()));
    i.addSingleton(ThemeRepository.new);
    i.addSingleton(ThemeViewmodel.new);
    i.addSingleton<ClientHttp>(ClientHttp.new);
  }

  @override
  void binds(Injector i) {
    i.add(() => ThemeStorage(i.get<SharedPreferencesStorage>()));
  }

}
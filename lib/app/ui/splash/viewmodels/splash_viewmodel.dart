import 'package:flutter_modular/flutter_modular.dart';
import 'package:result_dart/result_dart.dart';
import 'package:treinamento_flutter/app/data/repositories/core/theme_repository.dart';
import 'package:treinamento_flutter/app/data/services/core/database_service.dart';
import 'package:treinamento_flutter/app/utils/command.dart';

class SplashViewModel implements Disposable {
  final ThemeRepository _themeRepository;
  final DatabaseService _databaseService;

  SplashViewModel(this._themeRepository, this._databaseService) {
    loadCommand = Command0(_loadInitialDependencies);
    loadCommand.execute();
  }

  late final Command0<Unit> loadCommand;

  AsyncResult<Unit> _loadInitialDependencies() async {
    await _databaseService.init();
    await _themeRepository.init();
    return const Success(unit);
  }

  @override
  void dispose() {
    loadCommand.dispose();
  }

}
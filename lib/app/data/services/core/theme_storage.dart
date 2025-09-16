import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';
import 'package:treinamento_flutter/app/data/services/core/local_storage/local_storage.dart';

const _key = 'theme';

class ThemeStorage{

  final LocalStorage _localStorage;

  ThemeStorage(this._localStorage);

  AsyncResult<ThemeMode> getTheme() async {
    return _localStorage.read(key: _key).map((name){
      return ThemeMode.values.firstWhere((e) => e.name == name);
    });
  }

  AsyncResult<ThemeMode> saveTheme(ThemeMode themeMode) async {
    return _localStorage.write(key: _key, value: themeMode.name).map((name){
      return ThemeMode.values.firstWhere((e) => e.name == name);
    });
  }

  AsyncResult<String> removeTheme() async {
    return _localStorage.delete(key: _key);
  }

}
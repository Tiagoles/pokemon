import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:result_dart/result_dart.dart';
import 'package:rxdart/rxdart.dart';
import 'package:treinamento_flutter/app/data/services/core/theme_storage.dart';

class ThemeRepository implements Disposable{

  final ThemeStorage _localStorage;
  final BehaviorSubject<ThemeMode> _subject = BehaviorSubject<ThemeMode>.seeded(ThemeMode.system);

  ThemeRepository(this._localStorage);

  FutureOr<void> init() async {
    await getTheme().onSuccess(_subject.add);
  }

  @override
  void dispose() {
    _subject.close();
  }

  Stream<ThemeMode> get themeObserver => _subject.stream;

  AsyncResult<ThemeMode> getTheme() async {
    return _localStorage.getTheme();
  }

  AsyncResult<ThemeMode> saveTheme(ThemeMode themeMode) async {
    return _localStorage.saveTheme(themeMode).onSuccess(_subject.add);
  }

  AsyncResult<String> removeTheme() async {
    return _localStorage.removeTheme().onSuccess((_) => _subject.add(ThemeMode.system));
  }

}
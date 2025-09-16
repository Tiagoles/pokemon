import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/data/repositories/core/theme_repository.dart';

class ThemeViewmodel extends ValueNotifier<ThemeMode>{
  
  final ThemeRepository _repository;

  ThemeViewmodel(this._repository) : super(ThemeMode.system){
    _repository.themeObserver.listen((value){
      this.value = value;
    });
  }

  isDarkMode(BuildContext context){
    final brightness = MediaQuery.platformBrightnessOf(context);
    return value == ThemeMode.dark || (value == ThemeMode.system && brightness == Brightness.dark);
  }

  void toggleTheme(BuildContext context) {
    final isDark = isDarkMode(context);
    _repository.saveTheme(isDark ? ThemeMode.light : ThemeMode.dark);
  }

}
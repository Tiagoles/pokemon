import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/styles/themes/app_theme.dart';

extension ContextExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  ThemeMode get themeMode => MediaQuery.of(this).platformBrightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  bool get isDark => themeMode == ThemeMode.dark;
  ColorScheme get colors => Theme.of(this).colorScheme;
  CustomThemeExtension get customTheme => Theme.of(this).extension<CustomThemeExtension>()!;
  CustomColors get customColors => customTheme.resolveWithContext(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

}
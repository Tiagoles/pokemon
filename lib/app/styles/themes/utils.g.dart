part of 'app_theme.dart';

Gradient getGradientPrimaryLight(ColorScheme scheme){
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [scheme.primaryContainer, scheme.secondaryContainer],
  );
}

Gradient getGradientPrimary(ColorScheme scheme){
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [scheme.primary, scheme.secondary],
  );
}

Gradient getGradientError(ColorScheme scheme){
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [scheme.errorContainer, scheme.error],
  );
}

ColorFamily getThemeColor(BuildContext context, ExtendedColor color) {
  final brightness = Theme.of(context).brightness;
  final map = {
    Brightness.light: color.light,
    Brightness.dark: color.dark,
  };
  return map[brightness]!;
}

Color lightColor(Color color){
  return Color.alphaBlend(Colors.white.withValues(alpha: 0.5), color);
}

Color hoverColor(Color color){
  return Color.alphaBlend(Colors.white.withValues(alpha: 0.2), color);
}

ElevatedButtonThemeData _getElevatedButtonTheme(ColorScheme scheme){
  return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: TextStyle(color: scheme.surface, fontWeight: FontWeight.normal, fontSize: 14.0),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3.2)),
          ),
          backgroundColor: scheme.primary
      )
  );
}

InputDecorationTheme _getInputDecorationTheme(ColorScheme scheme){
  return InputDecorationTheme(
      filled: true,
      fillColor: scheme.surfaceContainerLowest,
      iconColor: scheme.outline,
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1,
              color: scheme.outlineVariant
          )
      ),
      labelStyle: TextStyle(color: scheme.outline, fontWeight: FontWeight.normal, fontSize: 4),
      hintStyle: TextStyle(
        color: scheme.outline,
      ),
      contentPadding: EdgeInsets.fromLTRB(12,6,12,6)
  );
}

(ColorScheme, CustomThemeExtension) getNormalAndCustomColors(BuildContext context){
  final colors = Theme.of(context).colorScheme;
  final customColors = Theme.of(context).extension<CustomThemeExtension>()!;
  return (colors, customColors);
}

TextTheme _getTextTheme(ColorScheme scheme){
  return TextTheme(
    bodySmall: TextStyle(color: scheme.onSurface, fontWeight: FontWeight.normal, fontSize: 12.0),
    bodyMedium: TextStyle(color: scheme.onSurface, fontWeight: FontWeight.normal, fontSize: 14.0),
    bodyLarge: TextStyle(color: scheme.onSurface, fontWeight: FontWeight.normal, fontSize: 16.0),
    titleSmall: TextStyle(color: scheme.primary, fontWeight: FontWeight.bold, fontSize: 14.0),
    titleMedium: TextStyle(color: scheme.primary, fontWeight: FontWeight.bold, fontSize: 16.0),
    titleLarge: TextStyle(color: scheme.primary, fontWeight: FontWeight.bold, fontSize: 20.0),
    headlineSmall: TextStyle(color: scheme.primary, fontWeight: FontWeight.bold, fontSize: 24.0),
    headlineMedium: TextStyle(color: scheme.primary, fontWeight: FontWeight.bold, fontSize: 28.0),
    headlineLarge: TextStyle(color: scheme.primary, fontWeight: FontWeight.bold, fontSize: 32.0),
    labelSmall: TextStyle(color: scheme.onSurface,
        fontWeight: FontWeight.normal, fontSize: 10.0),
    labelMedium: TextStyle(color: scheme.onSurface,
        fontWeight: FontWeight.normal, fontSize: 12.0),
    labelLarge: TextStyle(color: scheme.onSurface,
        fontWeight: FontWeight.normal, fontSize: 14.0),
    displaySmall: TextStyle(color: scheme.onSurface, fontWeight: FontWeight.normal, fontSize: 40.0),
    displayMedium: TextStyle(color: scheme.onSurface, fontWeight: FontWeight.normal, fontSize: 48.0),
    displayLarge: TextStyle(color: scheme.onSurface, fontWeight: FontWeight.normal, fontSize: 56.0),
  );
}

TextTheme createTextTheme(
    BuildContext context, String bodyFontString, String displayFontString, ColorScheme colors) {
  TextTheme baseTextTheme = _getTextTheme(colors);
  TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme =
  GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge?.copyWith(color: colors.onSurface),
    bodyMedium: bodyTextTheme.bodyMedium?.copyWith(color: colors.onSurface),
    bodySmall: bodyTextTheme.bodySmall?.copyWith(color: colors.onSurface),
    labelLarge: bodyTextTheme.labelLarge?.copyWith(color: colors.onSurface),
    labelMedium: bodyTextTheme.labelMedium?.copyWith(color: colors.onSurface),
    labelSmall: bodyTextTheme.labelSmall?.copyWith(color: colors.onSurface),
    displaySmall: displayTextTheme.displaySmall?.copyWith(color: colors.onSurface),
    displayMedium: displayTextTheme.displayMedium?.copyWith(color: colors.onSurface),
    displayLarge: displayTextTheme.displayLarge?.copyWith(color: colors.onSurface),
  );
  return textTheme.apply(
    bodyColor: colors.onSurface,
    displayColor: colors.onSurface,
  );
}

RadioThemeData _getRadioTheme(ColorScheme scheme){
  return RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return scheme.primaryContainer;
      return scheme.outline;
    }),
    visualDensity: VisualDensity.compact,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}

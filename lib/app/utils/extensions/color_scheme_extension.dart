import 'package:flutter/material.dart';

extension ColorSchemeExtension on ColorScheme {
  LinearGradient get gradientPrimaryLight => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryContainer, secondaryContainer],
  );
  LinearGradient get gradientPrimary => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, secondary],
  );
  LinearGradient get gradientTertiary => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [tertiaryContainer, tertiaryContainer.withValues(alpha: 0.8)],
  );
  LinearGradient get gradientRed => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [errorContainer, error],
  );
}
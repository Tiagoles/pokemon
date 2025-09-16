import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color get lightColor => Color.alphaBlend(Colors.white.withValues(alpha: 0.5), this);
  Color get hoverColor => Color.alphaBlend(Colors.white.withValues(alpha: 0.2), this);
}

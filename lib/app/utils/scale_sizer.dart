import 'package:flutter/material.dart';

class ScaleSize {
  /// Calcula o fator de escala de texto com base na largura da tela.
  /// - [context]: Contexto para acessar MediaQuery.
  /// - [maxScale]: Valor máximo permitido para escala (default: 2.0).
  /// - [baseWidth]: Largura de referência para telas grandes (default: 1400).
  static double textScaleFactor(
      BuildContext context, {
        double maxScale = 2.0,
        double baseWidth = 1400.0,
      }) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Escala proporcional à largura da tela, limitada por [maxScale]
    final scale = (screenWidth / baseWidth) * maxScale;

    // Garante que o fator esteja entre 1.0 e maxScale
    return scale.clamp(1.0, maxScale);
  }
}
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:treinamento_flutter/app/utils/extensions/double_extension.dart';
import 'package:treinamento_flutter/app/utils/extensions/string_to_decimal.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  final int decimalPlaces;

  DecimalTextInputFormatter([this.decimalPlaces = 2]);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
  ) {
    final oldValueDecimal = oldValue.text.isEmpty ? null : oldValue.text.toDecimal();
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Interpreta como centavos
    double value = double.tryParse(digitsOnly) ?? 0;
    value = value / (pow(10, decimalPlaces));

    final newText = oldValueDecimal == 0 && value == 0 ? '' : value.format(decimalPlaces);

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

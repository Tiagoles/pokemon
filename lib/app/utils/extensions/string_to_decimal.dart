extension StringToDecimal on String {
  double? toDecimal() {
    final num = double.tryParse(this);
    if (num != null) return num;
    final clean = replaceAll('.', '').replaceAll(',', '.');
    return double.tryParse(clean);
  }
}
import 'package:intl/intl.dart';

extension DoubleExtension on double {
  static final _cache = <int, NumberFormat>{};

  String format([int decimalPlaces = 2]) {
    final formatter = _cache.putIfAbsent(
      decimalPlaces,
          () => NumberFormat('#,##0.${'0' * decimalPlaces}', 'pt_BR'),
    );
    return formatter.format(this);
  }
}

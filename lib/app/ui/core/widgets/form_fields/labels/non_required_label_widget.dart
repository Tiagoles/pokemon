import 'package:flutter/material.dart';

class NonRequiredLabel extends StatelessWidget {
  final String text;
  final bool error;
  const NonRequiredLabel({
    super.key,
    required this.text,
    this.error = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Text(text, style: textTheme.labelMedium!
      .copyWith(color: error ? colors.error : colors.primary)
    );
  }
}

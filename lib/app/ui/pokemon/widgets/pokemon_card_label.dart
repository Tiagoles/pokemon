import 'package:flutter/material.dart';

class PokemonCardLabel extends StatelessWidget {
  final String text;
  const PokemonCardLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colors = theme.colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: colors.onSurface.withValues(alpha: 0.3),
      ),
      child: Text(
        text, style: textTheme.bodyMedium!.copyWith(
          color: colors.onInverseSurface
        ),
      )
    );
  }
}

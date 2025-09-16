import 'package:flutter/material.dart';

class RequiredLabel extends StatelessWidget {
  final String text;
  final bool error;
  const RequiredLabel({
    super.key,
    required this.text,
    this.error = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
            text,
            style: textTheme.labelMedium!.copyWith(
              color: error ? colors.error : colors.primary,
              fontWeight: FontWeight.bold
            )
        ),
        if(text.isNotEmpty) Text(
      '*',
          style: textTheme.labelMedium!.copyWith(
            color: colors.error,
            fontWeight: FontWeight.bold
          )
        )
      ],
    );
  }
}
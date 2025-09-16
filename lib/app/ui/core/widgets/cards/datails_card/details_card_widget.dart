import 'package:flutter/material.dart';

class DetailsCardWidget extends StatelessWidget {

  final String title;
  final String? text;

  const DetailsCardWidget({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colors.primary.withValues(alpha: 0.1),
        border: Border.all(
          color: colors.primary
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
      title,
            style: textTheme.labelMedium!.apply(color: colors.primary),
          ),
          Text(
            text ?? 'N/A',
            style: textTheme.titleSmall!.apply(color: colors.primary),
          )
        ],
      ),
    );
  }
}

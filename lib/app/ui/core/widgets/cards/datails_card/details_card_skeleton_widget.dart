import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailsCardSkeletonWidget extends StatelessWidget {

  const DetailsCardSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.primaryContainer.withValues(alpha: 0.1),
        border: Border.all(
          color: colors.onPrimaryContainer.withValues(alpha: 0.2),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Shimmer.fromColors(
        period: const Duration(seconds: 2),
        highlightColor: colors.primary.withValues(alpha: 0.5),
        baseColor: colors.primary.withValues(alpha: 0.3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FractionallySizedBox(
              widthFactor: 0.4,
              child: Container(
                height: 10,
                color: colors.surfaceContainerLowest,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 20,
              color: colors.surfaceContainerLowest,
            ),
          ],
        ),
      ),
    );
  }
}

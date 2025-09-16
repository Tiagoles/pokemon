import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OrderCardSkeleton extends StatelessWidget {
  const OrderCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
        decoration: BoxDecoration(
            color: colors.primaryContainer.withValues(alpha: 0.1),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: colors.onPrimaryContainer.withValues(alpha: 0.2))
        ),
        child: Shimmer.fromColors(
          // items: 1,
          period: const Duration(seconds: 2),
          highlightColor: colors.primary.withValues(alpha: 0.5),
          baseColor: colors.primary.withValues(alpha: 0.3),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity * 0.5,
                  height: 20,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity * 0.8,
                  height: 16,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 16,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(
                  width: 150,
                  height: 16,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

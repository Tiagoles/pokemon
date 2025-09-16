import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DynamicCardSkeletonWidget extends StatelessWidget {
  const DynamicCardSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(color: Colors.grey[200]!)
        )
      ),
      child: Shimmer.fromColors(
        period: const Duration(seconds: 2),
        highlightColor: colors.primary.withValues(alpha: 0.5),
        baseColor: colors.primary.withValues(alpha: 0.3),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                      height: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8), // Espaçamento entre os dois containers
                  Flexible(
                    flex: 7,
                    child: Container(
                      height: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                height: 20,
                color: Colors.white,
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity * 0.8,
                height: 16,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
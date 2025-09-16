import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';

class DragDownShapeWidget extends StatelessWidget {
  const DragDownShapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(0),
      width: context.screenWidth * 0.15,
      height: 5,
      decoration: BoxDecoration(
        color: colors.inverseSurface.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

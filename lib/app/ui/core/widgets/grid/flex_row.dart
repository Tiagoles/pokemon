import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/grid/grid_responsive_item.dart';

class FlexRow extends StatelessWidget {

  final List<GridResponsiveItem> children;
  final double gutter;

  const FlexRow({
    super.key,
    required this.children,
    this.gutter = 8
  });

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 12,
      mainAxisSpacing: gutter,
      crossAxisSpacing: gutter,
      children: children,
    );
  }
}

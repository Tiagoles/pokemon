import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:treinamento_flutter/app/domain/enums/core/breakpoint.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';

class GridResponsiveItem extends StatelessWidget {
  final Widget child;
  final String? colSizes;

  const GridResponsiveItem({super.key, required this.child, this.colSizes});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.fit(
        crossAxisCellCount: colSizes != null ?
        _getResponsiveColSize(context.screenWidth) : 12,
        child: child
    );
  }

  int _getResponsiveColSize(double screenWidth) {
    final List<String> sizes = colSizes!.split(' ');
    
    for(Breakpoint b in Breakpoint.values){
      if(screenWidth >= b.minWidth && screenWidth <= b.maxWidth){
        return _parseColSize(sizes, b);
      } 
    }

    return 12;
    
  }

  int _parseColSize(List<String> sizes, Breakpoint breakpoint) {

    if(breakpoint.cod <= 0) return 12;

    for (String size in sizes) {
      int? columns;
      if (size.startsWith('col-${breakpoint.abbreviation}-')) {
        columns = int.tryParse(size.replaceFirst('col-${breakpoint.abbreviation}-', ''));
        return columns != null && (columns > 12 || columns < 1) ? 12 : columns!;
      }
      if(RegExp(r'col-[0-9]*$').hasMatch(size) && breakpoint == Breakpoint.xs){
        columns = int.tryParse(size.replaceFirst('col-', ''));
        return columns != null && (columns > 12 || columns < 1) ? 12 : columns!;
      }
    }

    if(breakpoint.cod == 1) return 12;

    return _parseColSize(sizes, Breakpoint.getByCode(breakpoint.cod - 1)!);

  }

}

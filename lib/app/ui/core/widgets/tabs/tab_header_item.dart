import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/tabs/tabset.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';

class TabHeaderItem extends StatelessWidget{

  final TabItem tab;
  final int index;
  final bool isActive;
  final ValueChanged<int> onTabSelected;

  const TabHeaderItem({
    super.key,
    required this.tab,
    required this.onTabSelected,
    required this.index,
    required this.isActive
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    if(tab.isHidden) return Container();
    return InkWell(
      onTap: () => onTabSelected(index),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
          border: getBorder(colors.outline),
        ),
        child: Row(
          spacing: 8,
          children: [
            if (tab.icon != null) Icon(tab.icon, size: 16),
            Text(
              tab.heading,
              style: context.textTheme.labelMedium!
                  .apply(color: colors.outline),
            ),
          ],
        ),
      ),
    );

  }

  Border getBorder(Color color){
    if(isActive){
      return Border(
        top: BorderSide(color: color),
        right: BorderSide(color: color),
        left: BorderSide(color: color)
      );
    }
    return Border(bottom: BorderSide(color: color));
  }

}
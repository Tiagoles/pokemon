import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';
import 'tab_header_item.dart';
import 'tabset.dart';

class TabHeader extends StatelessWidget {

  /// List of tabs to be displayed
  final List<TabItem> tabs;
  /// Callback to be called when a tab is selected if it is not disabled
  final ValueChanged<int> onTabSelected;
  /// The index of the active tab
  final int activeIndex;

  const TabHeader({
    super.key,
    required this.tabs,
    required this.activeIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ...items,
        Expanded(child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: context.colors.outline))
          ),
        ))
      ],
    );
  }

  List<Widget> get items{
    return tabs.mapIndexed((index, tab) {
      return TabHeaderItem(
        isActive: activeIndex == index,
        tab: tab,
        onTabSelected: (index) {
          if(!tab.isDisabled) onTabSelected(index);
        },
        index: index,
      );
    }).toList();
  }

}
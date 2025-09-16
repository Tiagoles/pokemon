import 'package:flutter/material.dart';
import 'tab_header.dart';

class TabItem{
  final String heading;
  final Widget content;
  final IconData? icon;
  final bool isDisabled;
  final bool isHidden;

  TabItem({
    required this.heading,
    required this.content,
    this.icon,
    this.isDisabled = false,
    this.isHidden = false
  });

}

class Tabset extends StatefulWidget {

  final List<TabItem> tabs;

  const Tabset({
    super.key,
    required this.tabs
  });

  @override
  State<Tabset> createState() => _TabsetState();
}

class _TabsetState extends State<Tabset> {

  final activeTab = ValueNotifier(0);

  @override
  void dispose() {
    activeTab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: activeTab,
        builder: (context, snapshot, _){
          return Column(
            children: [
              TabHeader(
                activeIndex: activeTab.value,
                onTabSelected: (index){
                  activeTab.value = index;
                },
                tabs: widget.tabs,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: IndexedStack(
                  key: ValueKey<int>(activeTab.value),
                  index: activeTab.value,
                  children: [
                    for (var tab in widget.tabs)
                      if (!tab.isHidden)
                        tab.content,
                  ],
                ),
              )
            ],
          );
        }
    );
  }
}
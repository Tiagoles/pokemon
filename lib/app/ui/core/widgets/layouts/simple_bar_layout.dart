import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/menu/app_bar/app_bar_widget.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/menu/sidenav/sidenav_widget.dart';

class SimpleBarLayout extends StatelessWidget {
  final Widget child;
  final Future<void> Function()? onRefresh;
  final PreferredSizeWidget appBar;

  const SimpleBarLayout({
    super.key,
    required this.child,
    this.onRefresh,
    this.appBar = const AppBarWidget(),
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: appBar,
      drawer: const SidenavWidget(),
      body: onRefresh != null
          ? RefreshIndicator(
        onRefresh: onRefresh!,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8, top: 16),
          child: child,
        ),
      )
          : Padding(
        padding:
        const EdgeInsets.only(bottom: 8, right: 8, left: 8, top: 16),
        child: child,
      ),
    ));
  }
}

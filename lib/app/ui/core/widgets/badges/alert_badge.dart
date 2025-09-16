import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class AlertBadge extends StatelessWidget {

  final Widget child;
  final String? text;

  const AlertBadge({
    super.key,
    required this.child,
    this.text
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return badges.Badge(
      badgeStyle: badges.BadgeStyle(
        badgeColor: colors.tertiaryContainer,
      ),
      position: badges.BadgePosition.topEnd(end: -20),
      badgeContent: Text(text ?? '', style: textTheme.labelSmall!.apply(color: colors.onTertiaryContainer)),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class AlertDangerWidget extends StatelessWidget {

  final IconData icon;
  final String title;

  const AlertDangerWidget({
    super.key,
    this.icon = TablerIcons.alert_triangle,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.errorContainer,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: colors.errorContainer),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: colors.onErrorContainer,
            size: 32,
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: textTheme.bodyMedium!.apply(color: colors.onErrorContainer)))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../shapes/shapes.d.dart';

class AlertDialogWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final String title;
  final Widget content;
  final List<Widget> actions;
  final IconData? iconData;
  final Color? iconColor;
  final bool canClose;

  const AlertDialogWidget({
    super.key,
    this.backgroundColor,
    required this.title,
    required this.content,
    required this.actions,
    this.textColor,
    this.iconData,
    this.iconColor,
    this.canClose = true,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return SafeArea(child: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          color: backgroundColor ?? colors.surface,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(canClose)
              const Padding(
                padding: EdgeInsets.only(top: 24),
                child: DragDownShapeWidget(),
              ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 16,
                  top: 32,
                  left: 16,
                  right: 16
              ),
              child: Text(
                title,
                style: textTheme.titleMedium!.apply(color: textColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (iconData != null) ...[
                    Icon(
                      iconData,
                      size: 48,
                      color: iconColor ?? colors.primary,
                    ),
                    const SizedBox(height: 16),
                  ],
                  content,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: actions,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
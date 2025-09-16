import 'package:flutter/material.dart';

class DynamicCardWidget extends StatefulWidget {

  final String? index;
  final String title;
  final Map<String, String> data;
  final Widget? leading;
  final Color? backgroundColor;

  const DynamicCardWidget({
    super.key,
    this.index,
    required this.title,
    required this.data,
    this.backgroundColor,
    this.leading
  });

  @override
  State<DynamicCardWidget> createState() => _DynamicCardWidgetState();
}

class _DynamicCardWidgetState extends State<DynamicCardWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? colors.surfaceContainerLowest,
        border: BorderDirectional(
          bottom: BorderSide(
            width: 1,
            color: colors.surfaceContainerHigh,
          )
        )
      ),
      child: Card(
        color: colors.surface.withValues(alpha: 0),
        shadowColor: colors.surfaceContainerHigh.withValues(alpha: 0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if(widget.leading != null)...[
                  widget.leading!,
                  const SizedBox(width: 16.0),
                ],
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...widget.data.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entry.key,
                            style: Theme.of(context).textTheme.labelMedium
                            !.copyWith(color: colors.primary, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            entry.value,
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

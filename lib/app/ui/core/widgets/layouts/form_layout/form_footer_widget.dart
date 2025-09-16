import 'package:flutter/material.dart';

class FormFooterWidget extends StatelessWidget {

  final List<Widget> children;

  const FormFooterWidget({
    super.key,
    required this.children
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: colors.surfaceContainerLowest,
          border: BorderDirectional(
              top: BorderSide(
                  color: colors.surfaceContainerHighest,
                  width: 1
              )
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: children,
      ),
    );
  }
}

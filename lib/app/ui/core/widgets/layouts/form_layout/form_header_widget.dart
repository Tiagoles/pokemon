import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {

  final String title;

  const FormHeaderWidget({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: colors.surfaceContainerLowest,
          border: BorderDirectional(
              bottom: BorderSide(
                  color: colors.surfaceContainerHighest,
                  width: 1
              )
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        )
      ),
    );
  }
}

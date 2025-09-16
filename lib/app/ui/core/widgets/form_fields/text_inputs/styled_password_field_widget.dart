import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class StyledPasswordFieldWidget extends StatefulWidget {

  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final bool isVisible;
  final List<TextInputFormatter> formatters;

  const StyledPasswordFieldWidget({
    required this.controller,
    required this.hintText,
    this.validator,
    this.enabled = true,
    this.isVisible = false,
    this.formatters = const [],
    super.key,
  });

  @override
  State<StyledPasswordFieldWidget> createState() => _StyledPasswordFieldWidgetState();
}

class _StyledPasswordFieldWidgetState extends State<StyledPasswordFieldWidget> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final ThemeData appTheme = Theme.of(context);
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      obscureText: !isVisible,
      validator: widget.validator,
      keyboardType: TextInputType.visiblePassword,
      inputFormatters: widget.formatters,
      enabled: widget.enabled,
      statesController: WidgetStatesController(),
      style: appTheme.textTheme.labelLarge!.copyWith(color: colors.outline),
      decoration: InputDecoration(
        filled: true,
        errorMaxLines: 3,
        fillColor: widget.enabled ? colors.surfaceContainerLowest : colors.surface,
        contentPadding: const EdgeInsets.symmetric(vertical: 6.0,
            horizontal: 12.0),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: colors.outline,
        ),
        prefixIcon: Icon(TablerIcons.lock, size: 16, color: colors.outline),
        suffixIcon: IconButton(
          highlightColor: colors.primary.withValues(alpha: 0),
          padding: EdgeInsets.zero,
          icon: Icon(
            isVisible ? TablerIcons.eye_off : TablerIcons.eye,
            color: colors.outline,
            size: 16,
          ),
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: colors.surfaceContainerHigh,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: colors.surfaceContainerHigh,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: colors.outline,
          ),
        ),
      ),
    );
  }
}

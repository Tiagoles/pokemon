import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';
import 'package:treinamento_flutter/app/utils/functions.dart';

class StyledTextFieldWidget extends StatefulWidget {

  final String hintText;
  final Widget? prefixContent;
  final Widget? suffixContent;
  final BorderRadius borderRadius;
  final TextEditingController controller;
  final bool obscureText;
  final IconData? _prefixIcon;
  final IconData? _suffixIcon;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final int? minLines;
  final TextInputAction textInputAction;
  final TextInputType type;
  final Function(String)? onSubmitted;
  final bool enabled;
  final List<TextInputFormatter> formatters;

  const StyledTextFieldWidget({
    required this.controller,
    required this.hintText,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
    this.prefixContent,
    this.suffixContent,
    this.obscureText = false,
    IconData? prefixIcon,
    IconData? suffixIcon,
    this.validator,
    this.maxLines,
    this.minLines,
    this.enabled = true,
    this.onSubmitted,
    this.textInputAction = TextInputAction.done,
    this.type = TextInputType.text,
    this.formatters = const [],
    super.key,
  }) : _prefixIcon = prefixIcon, _suffixIcon = suffixIcon;

  @override
  State<StyledTextFieldWidget> createState() => _StyledTextFieldWidgetState();
}

class _StyledTextFieldWidgetState extends State<StyledTextFieldWidget> {

  @override
  Widget build(BuildContext context) {
    final (colors, textTheme) = (context.colors, context.textTheme);
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapAlwaysCalled: false,
      onTapOutside: (_) {
        closeKeyboard();
      },
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      obscureText: widget.obscureText,
      validator: widget.validator,
      maxLines: widget.maxLines ?? 1,
      minLines: widget.minLines,
      onFieldSubmitted: widget.onSubmitted,
      keyboardType: widget.type,
      inputFormatters: widget.formatters,
      enabled: widget.enabled,
      statesController: WidgetStatesController(),
      style: textTheme.labelLarge!.copyWith(color: colors.outline),
      decoration: InputDecoration(
        filled: true,
        errorMaxLines: 3,
        suffixIconColor: colors.outline,
        suffixIcon: suffixIcon,
        fillColor: widget.enabled ? colors.surfaceContainerLowest : colors.surface,
        contentPadding: const EdgeInsets.symmetric(vertical: 6.0,
            horizontal: 12.0),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: colors.outline,
        ),
        enabled: widget.enabled,
        prefixIcon: prefixIcon,
        prefixIconColor: colors.outline,
        border: OutlineInputBorder(
          borderRadius: widget.borderRadius,
          borderSide: BorderSide(
            color: colors.surfaceContainerHigh,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius,
          borderSide: BorderSide(
            color: colors.surfaceContainerHigh,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius,
          borderSide: BorderSide(
            color: colors.outline,
          ),
        ),
      ),
    );
  }

  Widget? get prefixIcon{
    if(widget.prefixContent != null) return widget.prefixContent;
    if(widget._prefixIcon != null) return Icon(widget._prefixIcon, size: 16);
    return null;
  }

  Widget? get suffixIcon{
    if(widget.suffixContent != null) return widget.suffixContent;
    if(widget._suffixIcon != null) return Icon(widget._suffixIcon, size: 16);
    return null;
  }

}

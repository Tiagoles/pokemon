import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';

import 'bootstrap_button_style.dart';

class BootstrapElevatedButtonWidget extends StatefulWidget {
  final VoidCallback? onPressed;
  final ButtonColor buttonColor;
  final ButtonSize buttonSize;
  final String? label;
  final IconData? icon;
  final double paddingHorizontal;
  final double paddingVertical;

  const BootstrapElevatedButtonWidget({
    super.key,
    this.onPressed,
    this.label,
    this.buttonColor = ButtonColor.primary,
    this.buttonSize = ButtonSize.normal,
    this.icon,
    required this.paddingHorizontal,
    required this.paddingVertical
  });

  @override
  State<BootstrapElevatedButtonWidget> createState() =>
      _BootstrapElevatedButtonWidgetState();
}

class _BootstrapElevatedButtonWidgetState extends State<BootstrapElevatedButtonWidget> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation _colorAnimation;
  late MappedColor _mappedColor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: BootstrapButtonStyle.animationDuration,
      vsync: this
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateTheme();
  }

  void _updateTheme(){
    if(!mounted) return;
    _mappedColor = BootstrapButtonStyle.getMappedColor(widget.buttonColor, context);
    _colorAnimation = ColorTween(begin: _mappedColor.basic, end: _mappedColor.hover).animate(_controller);
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size.zero,
            backgroundColor: _colorAnimation.value,
            disabledBackgroundColor: _mappedColor.disabled,
            textStyle: _textStyle(context),
            padding: EdgeInsets.symmetric(
              horizontal: widget.paddingHorizontal,
              vertical: widget.paddingVertical,
            ),
            shape: BootstrapButtonStyle.buttonShape(),
          ),
          onPressed: widget.onPressed == null
              ? null
              : () {
            _controller.forward().whenComplete(() => _controller.reverse());
            widget.onPressed!();
          },
          child: Wrap(
            spacing: 8,
            children: [
              if(widget.icon != null)
                Icon(
                  widget.icon,
                  color: _getContentColor(context),
                  size: _iconSize(context)
              ),
              if(widget.label != null)
                Text(
                  textAlign: TextAlign.center,

                  widget.label!,
                  style: _textStyle(context)!.copyWith(height: 1.05),
                )
            ],
          ),
        );
      },
    );
  }

  TextStyle? _textStyle(BuildContext context) {
    final TextStyle? style = BootstrapButtonStyle.getTextSize(widget.buttonSize, context);

    return style!.copyWith(color:_getContentColor(context));

  }

  Color _getContentColor(BuildContext context){
    final customColors = context.customColors;
    final colorMap = {
      ButtonColor.primary: context.colors.onPrimaryContainer,
      ButtonColor.secondary: context.colors.onSecondaryContainer,
      ButtonColor.success: customColors.success.onColorContainer,
      ButtonColor.danger: context.colors.onErrorContainer,
      ButtonColor.warning: context.colors.onTertiaryContainer,
      ButtonColor.info: customColors.info.onColorContainer,
      ButtonColor.light: context.colors.onSurface,
      ButtonColor.dark: customColors.neutralDark.onColor,
      ButtonColor.defaultColor: context.colors.surface,
    };
    return colorMap[widget.buttonColor]!;
  }

  double _iconSize(BuildContext context) {
    if(widget.label == null){
      return ((widget.paddingVertical + widget.paddingHorizontal) / 2) * 1.6;
    }
    return BootstrapButtonStyle.getTextSize(widget.buttonSize, context)!
        .fontSize!;
  }

}

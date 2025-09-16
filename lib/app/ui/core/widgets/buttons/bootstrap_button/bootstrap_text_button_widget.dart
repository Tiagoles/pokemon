import 'package:flutter/material.dart';
import 'bootstrap_button_style.dart';

class BootstrapTextButtonWidget extends StatefulWidget {
  final VoidCallback? onPressed;
  final ButtonColor buttonColor;
  final ButtonSize buttonSize;
  final String? label;
  final IconData? icon;
  final double paddingHorizontal;
  final double paddingVertical;

  const BootstrapTextButtonWidget({
    super.key,
    this.onPressed,
    this.label,
    this.buttonSize = ButtonSize.normal,
    this.buttonColor = ButtonColor.primary,
    this.icon,
    required this.paddingHorizontal,
    required this.paddingVertical
  });

  @override
  State<BootstrapTextButtonWidget> createState() => _BootstrapTextButtonWidgetState();
}

class _BootstrapTextButtonWidgetState extends State<BootstrapTextButtonWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late MappedColor _mappedColor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: BootstrapButtonStyle.animationDuration,
      vsync: this,
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
    _colorAnimation = ColorTween(
      begin: _mappedColor.basic,
      end: _mappedColor.hover,
    ).animate(_controller);
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
        return TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: widget.paddingHorizontal,
              vertical: widget.paddingVertical,
            ),
            foregroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            overlayColor: Colors.transparent,
            minimumSize: Size.zero,
            textStyle: TextStyle(
              decoration: widget.onPressed != null ? TextDecoration.underline : null,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          onPressed: widget.onPressed == null ? null : () {
            _controller.forward().whenComplete(() => _controller.reverse());
            widget.onPressed!();
          },
          child: Wrap(
            spacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children:[
                if(widget.icon != null)
                  Icon(
                      widget.icon,
                      color: _colorAnimation.value,
                      size: _iconSize(context)
                  ),
                if(widget.label != null)
                  Text(
                    widget.label!,
                    style: _textStyle(context)
                  )
            ]
          ),
        );
      },
    );
  }

  TextStyle? _textStyle(BuildContext context) {
    final TextStyle? style = BootstrapButtonStyle.getTextSize(widget.buttonSize, context);
    return style!.copyWith(
      color: widget.onPressed != null ? _colorAnimation.value : _mappedColor.disabled,
      decoration: widget.onPressed != null ? TextDecoration.underline : null,
      decorationColor: _colorAnimation.value
    );
  }

  double _iconSize(BuildContext context) {
    if(widget.label == null){
      return ((widget.paddingVertical + widget.paddingHorizontal) / 2) * 1.6;
    }
    return BootstrapButtonStyle.getTextSize(widget.buttonSize, context)!
        .fontSize!;
  }

}
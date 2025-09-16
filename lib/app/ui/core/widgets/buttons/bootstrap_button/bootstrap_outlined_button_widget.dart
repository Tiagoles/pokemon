import 'package:flutter/material.dart';
import 'bootstrap_button_style.dart';

class BootstrapOutlinedButtonWidget extends StatefulWidget {
  final VoidCallback? onPressed;
  final ButtonColor buttonColor;
  final ButtonSize buttonSize;
  final String? label;
  final IconData? icon;
  final double paddingHorizontal;
  final double paddingVertical;

  const BootstrapOutlinedButtonWidget({
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
  State<BootstrapOutlinedButtonWidget> createState() => _BootstrapOutlinedButtonWidgetState();
}

class _BootstrapOutlinedButtonWidgetState extends State<BootstrapOutlinedButtonWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _backgroundColorAnimation;
  late Animation<Color?> _textColorAnimation;
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
  didChangeDependencies() {
    super.didChangeDependencies();
    _updateTheme();
  }

  _updateTheme(){
    if(!mounted) return;
    _mappedColor = BootstrapButtonStyle.getMappedColor(widget.buttonColor, context);
    _setBackgroundTween();
    _setTextColorTween();
    setState(() {});
  }

  _setBackgroundTween(){
    _backgroundColorAnimation = ColorTween(
      begin: _mappedColor.transparent,
      end: _mappedColor.basic,
    ).animate(_controller);
  }

  void _setTextColorTween(){
    final colors = Theme.of(context).colorScheme;
    if([ButtonColor.warning, ButtonColor.info, ButtonColor.light].contains(widget.buttonColor)){
      _textColorAnimation = ColorTween(
        begin: _mappedColor.basic,
        end: colors.onSurface,
      ).animate(_controller);
      return;
    }

    _textColorAnimation = ColorTween(
      begin: _mappedColor.basic,
      end: colors.surface,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return OutlinedButton(
          style: ButtonStyle(
            minimumSize: const WidgetStatePropertyAll(Size.zero),
            backgroundColor: WidgetStatePropertyAll(_backgroundColorAnimation.value),
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            shadowColor: const WidgetStatePropertyAll(Colors.transparent),
            surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
            foregroundColor: const WidgetStatePropertyAll(Colors.transparent),
            side: WidgetStateProperty.resolveWith((status){
              if(status.contains(WidgetState.disabled)){
                return BorderSide(color: _mappedColor.disabled, width: 1);
              }
              return BorderSide(color: _mappedColor.basic, width: 1);
            }),
            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
              horizontal: widget.paddingHorizontal,
              vertical: widget.paddingVertical,
            )),
            shape: WidgetStatePropertyAll(BootstrapButtonStyle.buttonShape()),
            textStyle: WidgetStatePropertyAll(_textStyle(context)),
          ),
          onPressed: widget.onPressed == null
              ? null
              : () {
            _controller.forward().whenComplete(() => _controller.reverse());
            widget.onPressed!();
          },
          child: Wrap(
            spacing: 8,
            children: <Widget>[
              if(widget.icon != null)
                Icon(
              widget.icon,
                  color: _textColorAnimation.value,
                  size: _iconSize(context)
                ),
              if(widget.label != null)
                Text(
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
    return style!.apply(color: widget.onPressed != null ? _textColorAnimation.value : _mappedColor.disabled );
  }

  double _iconSize(BuildContext context) {
    if(widget.label == null){
      return ((widget.paddingVertical + widget.paddingHorizontal) / 2) * 1.6;
    }
    return BootstrapButtonStyle.getTextSize(widget.buttonSize, context)!
        .fontSize!;
  }

}
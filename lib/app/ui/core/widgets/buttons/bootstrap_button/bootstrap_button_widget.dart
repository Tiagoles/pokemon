import 'package:flutter/material.dart';

import 'bootstrap_button_style.dart';
import 'bootstrap_elevated_button_widget.dart';
import 'bootstrap_outlined_button_widget.dart';
import 'bootstrap_text_button_widget.dart';

class BootstrapButtonWidget extends StatefulWidget {
  final String? text;
  final VoidCallback? onPressed;
  final ButtonColor color;
  final double fontSize;
  final double paddingHorizontal;
  final double paddingVertical;
  final ButtonSize size;
  final ButtonType type;
  final IconData? icon;

  const BootstrapButtonWidget({
    this.text,
    this.onPressed,
    this.color = ButtonColor.primary,
    this.fontSize = 16.0,
    this.paddingHorizontal = 16.0,
    this.paddingVertical = 14.0,
    this.size = ButtonSize.normal,
    this.type = ButtonType.elevatedButton,
    this.icon,
    super.key,
  });

  @override
  State<BootstrapButtonWidget> createState() => _BootstrapButtonWidgetState();
}

class _BootstrapButtonWidgetState extends State<BootstrapButtonWidget> {
  @override
  Widget build(BuildContext context) {
    if([ButtonSize.block, ButtonSize.largeBlock, ButtonSize.smallBlock].contains(widget
        .size)){
      return SizedBox(
        width: double.infinity,
        child: _getButtonByType(),
      );
    }
    return _getButtonByType();
  }

  Widget _getElevatedButton(){
    return BootstrapElevatedButtonWidget(
      paddingHorizontal: widget.paddingHorizontal,
      paddingVertical: widget.paddingVertical,
      label: widget.text,
      buttonColor: widget.color,
      onPressed: widget.onPressed,
      key: widget.key,
      buttonSize: widget.size,
      icon: widget.icon
    );
  }

  Widget _getOutlinedButton(){
    return BootstrapOutlinedButtonWidget(
      paddingHorizontal: widget.paddingHorizontal,
      paddingVertical: widget.paddingVertical,
      label: widget.text,
      buttonColor: widget.color,
      onPressed: widget.onPressed,
      key: widget.key,
      buttonSize: widget.size,
      icon: widget.icon,
    );
  }

  Widget _getTextButton(){
    return BootstrapTextButtonWidget(
      paddingHorizontal: widget.paddingHorizontal,
      paddingVertical: widget.paddingVertical,
      label: widget.text,
      buttonColor: widget.color,
      onPressed: widget.onPressed,
      key: widget.key,
      buttonSize: widget.size,
      icon: widget.icon,
    );
  }

  Widget _getButtonByType(){
    switch (widget.type) {
      case ButtonType.elevatedButton:
        return _getElevatedButton();
      case ButtonType.outlinedButton:
        return _getOutlinedButton();
      case ButtonType.textButton:
        return _getTextButton();
    }
  }
}
import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';

class ToggleCircleIconButtonWidget extends StatefulWidget {
  final IconData icon;
  final Color checkedBackgroundColor;
  final Color checkedTextColor;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final bool isChecked;

  const ToggleCircleIconButtonWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.checkedBackgroundColor,
    required this.checkedTextColor,
    required this.backgroundColor,
    required this.textColor,
    required this.isChecked,
  });

  @override
  State<ToggleCircleIconButtonWidget> createState() =>
      _ToggleCircleIconButtonWidgetState();
}

class _ToggleCircleIconButtonWidgetState
    extends State<ToggleCircleIconButtonWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
          shape: CircleBorder(
              side: BorderSide(color: widget.checkedBackgroundColor)),
          backgroundColor: widget.isChecked
              ? widget.checkedBackgroundColor
              : widget.backgroundColor,
          padding: const EdgeInsets.all(8)),
      onPressed: () {
        widget.onPressed();
      },
      icon: Icon(
        widget.icon,
        size: context.screenWidth * 0.05,
        color: widget.isChecked ? widget.checkedTextColor : widget.textColor,
      ),
    );
  }
}

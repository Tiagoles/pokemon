import 'package:flutter/material.dart';

class SnackbarWidget extends StatefulWidget {
  final String message;
  final Color? backgroundColor;
  final Color? progressColor;
  final Duration duration;
  final IconData icon;
  final Color textColor;
  final double cornerRadius;
  final Color borderColor;

  const SnackbarWidget({
    super.key,
    required this.message,
    this.backgroundColor,
    this.progressColor,
    this.duration = const Duration(seconds: 3),
    required this.icon,
    required this.textColor,
    required this.cornerRadius,
    required this.borderColor,
  });

  @override
  State<SnackbarWidget> createState() => _SnackbarWithProgressState();
}

class _SnackbarWithProgressState extends State<SnackbarWidget> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _progressController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _progressController = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..addListener((){
      setState(() {});
    });

    _controller.forward();
    _progressController.forward();

    _progressController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse().then((value) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? colors.surface,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: widget.borderColor.withValues(alpha: 0.2)
          )
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: Row(
                children: [
                  Icon(
                widget.icon,
                    color: widget.textColor,
                    size: 32,
                  ),
                  const SizedBox(width: 16),
                  Expanded(child: Text(
                    widget.message,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    style: textTheme.bodyMedium!.apply(color: widget.textColor),
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 4.0,
              child: LinearProgressIndicator(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                value: _progressController.value,
                backgroundColor: colors.surface.withValues(alpha: 0),
                valueColor: AlwaysStoppedAnimation<Color>(widget.progressColor ?? colors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
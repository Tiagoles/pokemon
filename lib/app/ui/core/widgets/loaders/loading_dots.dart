import 'dart:async';
import 'package:flutter/material.dart';

class LoadingDots extends StatefulWidget {
  /// The speed of the loading dots animation in milliseconds.
  final int speed;
  final TextStyle? style;

  const LoadingDots({super.key, this.style, this.speed=500});

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots> {
  int dotCount = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: widget.speed), (_) {
      setState(() {
        dotCount = (dotCount + 1) % 4; // 0, 1, 2, 3
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '.' * dotCount,
      style: widget.style ?? const TextStyle(fontSize: 24),
    );
  }
}

import 'package:flutter/material.dart';

class BrandLoader extends StatelessWidget {

  final double width;
  final double height;

  const BrandLoader({
    super.key,
    required this.width,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/brand_animate.gif',
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }
}

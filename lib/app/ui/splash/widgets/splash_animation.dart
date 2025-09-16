import 'dart:async';
import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';

class SplashAnimation extends StatefulWidget {

  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation> {
  late final List<_SplashFrame> _frames;
  int _currentIndex = 0;
  late Timer _timer;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      _frames = [
        _SplashFrame(color: context.colors.tertiaryContainer, image: 'assets/images/sm_gray.png'),
        _SplashFrame(color: Colors.white, image: 'assets/images/sm_primary.png'),
        _SplashFrame(color: context.colors.primaryContainer, image: 'assets/images/sm_warning.png'),
      ];

      // pré-carrega imagens para evitar travos
      for (var frame in _frames) {
        precacheImage(AssetImage(frame.image), context);
      }

      _timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _frames.length;
        });
      });

      _initialized = true;
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final frame = _frames[_currentIndex];

    return Scaffold(
      body: AnimatedContainer(
        width: double.infinity,
        duration: const Duration(milliseconds: 300),
        color: frame.color,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(scale: animation, child: child),
            );
          },
          child: Image.asset(
            frame.image,
            key: ValueKey(frame.image),
            width: double.infinity,
            height: 200,
          ),
        ),
      ),
    );
  }
}

class _SplashFrame {
  final Color color;
  final String image;

  _SplashFrame({required this.color, required this.image});
}
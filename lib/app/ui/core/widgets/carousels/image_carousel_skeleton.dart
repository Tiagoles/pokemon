import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shimmer/shimmer.dart';

class ImageCarouselSkeleton extends StatefulWidget {
  const ImageCarouselSkeleton({super.key});

  @override
  State<ImageCarouselSkeleton> createState() => _ImageCarouselSkeletonState();
}

class _ImageCarouselSkeletonState extends State<ImageCarouselSkeleton> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<int> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this
    );

    _sizeAnimation = IntTween(begin: 32, end: 36).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic
    ));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Shimmer.fromColors(
          baseColor: colors.primaryContainer.withValues(alpha: 0.3),
          highlightColor: colors.secondaryContainer.withValues(alpha: 0.5),
          child: Container(
            color: colors.surface,
            width: double.infinity,
            height: double.infinity,
            child: const Icon(TablerIcons.photo_scan),
          ),
        ),
        AnimatedBuilder(animation: _sizeAnimation, builder: (_, child){
          return Positioned.fill(
              child: Shimmer.fromColors(
                baseColor: colors.onPrimaryContainer,
                highlightColor: colors.onSecondaryContainer.withValues(alpha: 0.5),
                child: Icon(TablerIcons.photo_search, size: _sizeAnimation.value.toDouble()),
          ));
        })
      ],
    );
  }
}

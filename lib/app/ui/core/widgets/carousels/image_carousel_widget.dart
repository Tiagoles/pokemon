import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';import 'carousel_slider/carousel_slider_widget.dart';


import 'image_carousel_skeleton.dart';

class ImageCarouselWidget extends StatefulWidget {
  final List<File> images;
  final Border border;
  final double height;
  final bool isLoading;

  const ImageCarouselWidget({
    super.key,
    required this.images,
    this.height = 200,
    this.isLoading = false,
    this.border = const Border(
      top: BorderSide.none,
      left: BorderSide.none,
      right: BorderSide.none,
      bottom: BorderSide.none,
    ),
  });

  @override
  State<ImageCarouselWidget> createState() => _ImageCarouselWidgetState();
}

class _ImageCarouselWidgetState extends State<ImageCarouselWidget> {

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colors.primary.withValues(alpha: 0.25),
        border: widget.border,
      ),
      child: _getCarousel(context),
    );
  }

  Widget _getCarousel(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    if(widget.isLoading){
      return SizedBox(
        height: widget.height,
        child: const Center(
          child: ImageCarouselSkeleton(),
        ),
      );
    }
    if (widget.images.isEmpty) {
      return SizedBox(
        height: widget.height,
        child: Center(
          child: Icon(
            TablerIcons.photo_off,
            size: 32,
            color: colors.primary,
          ),
        ),
      );
    }
    return CarouselSliderWidget(height: widget.height, images: widget.images);
  }
}
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/plugins/modal_actions.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/smart_image/smart_image.dart';

class CarouselSliderWidget extends StatelessWidget {

  final double height;
  final List<File> images;

  const CarouselSliderWidget({
    super.key,
    required this.height,
    required this.images
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        autoPlay: false,
        enlargeCenterPage: false,
        viewportFraction: 1.0,
      ),
      items: images.asMap().entries.map((entry) => GestureDetector(
        onTap: (){
          ModalActions.showGaleryModal(
            context,
            images: images,
            initialIndex: entry.key,
          );
        },
        child: Stack(
          children: [
            SmartImage(
              path: entry.value.path,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: colors.primaryContainer.withValues(alpha: 0.3), // Adjust opacity as needed
            ),
          ],
        ),
      )).toList(),
    );
  }
}

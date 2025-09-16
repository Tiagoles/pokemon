import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryDialogWidget extends StatefulWidget {
  final List<File> images;
  final int initialIndex;
  final Axis scrollDirection;
  final bool showPageIndicator;

  const GalleryDialogWidget({
    super.key,
    required this.images,
    this.initialIndex = 0,
    this.scrollDirection = Axis.horizontal,
    this.showPageIndicator = true,
  });

  @override
  State<GalleryDialogWidget> createState() => _GalleryDialogWidgetState();
}

class _GalleryDialogWidgetState extends State<GalleryDialogWidget> {
  late PageController pageController;
  bool allowPop = true;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.initialIndex);
  }

  Future<bool> _handlePop() async {
    setState(() {
      allowPop = false;
    });

    await Future.delayed(const Duration(milliseconds: 100));

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          await _handlePop();
        }
      },
      child: SafeArea(child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            PhotoViewGallery.builder(
              itemCount: widget.images.length,
              pageController: pageController,
              scrollPhysics: allowPop
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: _getImageProvider(widget.images[index].path),
                  initialScale: PhotoViewComputedScale.contained,
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 2,
                  heroAttributes: PhotoViewHeroAttributes(
                    tag: basename(widget.images[index].path),
                  ),
                );
              },
              scrollDirection: widget.scrollDirection,
              backgroundDecoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black.withValues(alpha: 0.7),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Galeria',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white, size: 30),
                      onPressed: () async {
                        if (await _handlePop()) {
                          if(context.mounted) Navigator.of(context).pop();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Page Indicator
            if (widget.showPageIndicator)
              Positioned(
                bottom: 20.0,
                left: 0.0,
                right: 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.images.length, (index) {
                    return AnimatedBuilder(
                      animation: pageController,
                      builder: (context, child) {
                        double selectedness = 1.0;
                        if (pageController.position.haveDimensions) {
                          final currentPage = pageController.page ?? widget.initialIndex.toDouble();
                          selectedness = (index == currentPage.round()) ? 1.0 : 0.4;
                        } else {
                          selectedness = (index == widget.initialIndex) ? 1.0 : 0.4;
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            width: 8.0 * selectedness,
                            height: 8.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedness > 0.5 ? Colors.white : Colors.grey,
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ),
          ],
        ),
      )),
    );
  }

  ImageProvider _getImageProvider(String path) {
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return NetworkImage(path);
    }
    return FileImage(File(path));
  }


}
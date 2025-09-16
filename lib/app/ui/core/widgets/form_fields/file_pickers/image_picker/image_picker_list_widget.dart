import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:treinamento_flutter/app/plugins/modal_actions.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/empty_widget.dart';

import 'image_preview_card_widget.dart';

class ImagePickerListWidget extends StatefulWidget {
  final List<File> images;

  const ImagePickerListWidget({super.key, required this.images});

  @override
  State<ImagePickerListWidget> createState() => _ImagePickerListWidgetState();
}

class _ImagePickerListWidgetState extends State<ImagePickerListWidget> {

  _removeItem(index){
    setState(() {
      if(widget.images[index].existsSync()) widget.images[index].delete();
      widget.images.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return const EmptyWidget();
    }
    return StaggeredGrid.count(
      crossAxisCount: 12,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: List.generate(
        widget.images.length,
            (index) {
          if(!widget.images[index].existsSync()){
            _removeItem(index);
            return Container();
          }
          return ImagePreviewCardWidget(
            onTap: () {
              ModalActions.showGaleryModal(context,
                  images: widget.images, initialIndex: index);
            },
            image: widget.images[index],
            onDelete: () {
              _removeItem(index);
            },
          );
        },
      ),
    );
  }
}

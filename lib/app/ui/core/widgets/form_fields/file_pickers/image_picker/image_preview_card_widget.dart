import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/grid/grid_responsive_item.dart';

class ImagePreviewCardWidget extends StatelessWidget {

  final VoidCallback onTap;
  final File image;
  final VoidCallback onDelete;

  const ImagePreviewCardWidget({
    super.key,
    required this.onTap,
    required this.image,
    required this.onDelete
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GridResponsiveItem(
        colSizes: 'col-6 col-md-4',
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: colors.surface, width: 1),
          ),
          elevation: 2,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  GestureDetector(
                    onTap: onTap,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.file(
                    image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor: colors.errorContainer.withValues(alpha: 0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(color: colors.onErrorContainer, width: 1),
                            )
                        ),
                        icon: const Icon(
                          TablerIcons.trash,
                          size: 16,
                        ),
                        color: colors.onErrorContainer,
                        onPressed: onDelete,
                      )
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}

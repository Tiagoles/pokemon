import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:treinamento_flutter/app/plugins/toastr_service.dart';
import 'dart:io';
import 'image_picker_list_widget.dart';

class ImagePickerWidget extends StatefulWidget {

  final List<File> images;

  const ImagePickerWidget({
    super.key,
    required this.images
  });



  @override
  State<ImagePickerWidget> createState() =>
      _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _showActionSheet(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Escolher Imagens'),
        message: const Text('Escolha de onde você deseja obter as imagens.'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: const Text('Câmera'),
            onPressed: () {
              Navigator.pop(context);
              _pickImages(ImageSource.camera);
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Galeria'),
            onPressed: () {
              Navigator.pop(context);
              _pickImages(ImageSource.gallery);
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancelar'),
        ),
      ),
    );
  }

  Future<void> _pickImages(ImageSource source) async {
    try {

      if(source == ImageSource.gallery){
       final List<XFile> pickedImages  = await _picker.pickMultiImage();
       if (pickedImages.isNotEmpty) {
         setState(() {
           widget.images.addAll(pickedImages.map((e) => File(e.path)).toList());
         });
       }
       return;
      }
      final result = await Modular.to.pushNamed<List<File>>('/camera/');
      if(result != null && result.isNotEmpty){
        setState(() {
          widget.images.addAll(result);
        });
      }

    } catch (e) {
      if(!mounted) return;
      ToastrService.error(
        context: context,
        message: 'Ops... Parece que não foi possível fazer o upload de sua imagem no momento',
        hasIcon: false
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () => _showActionSheet(context),
          child: DottedBorder(
            dashPattern: const [8,4],
            padding: const EdgeInsets.all(32),
            color: colors.outlineVariant,
            radius: const Radius.circular(4),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    TablerIcons.upload,
                    size: 24,
                    color: colors.primary,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Selecionar',
                    style: Theme.of(context).textTheme.titleMedium!.apply(
                        color: colors.primary
                    ),
                  ),
                  Text(
                    overflow: TextOverflow.clip,
              ' Imagens',
                    style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: colors.primary
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ImagePickerListWidget(images: widget.images),
      ],
    );
  }

}
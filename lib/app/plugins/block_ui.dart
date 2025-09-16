import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/loaders/block_ui_widget.dart';

class BlockUi {

  static Future<void> show(BuildContext context) async {
    final colors = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: colors.primaryContainer.withValues(alpha: 0.7),
      builder: (BuildContext contextDialog) {
        return const BlockUiWidget();
      },
    );
  }

  static Future<void> hide(BuildContext context) async {
    if(Modular.to.canPop()){
      return Modular.to.pop();
    }
  }

}
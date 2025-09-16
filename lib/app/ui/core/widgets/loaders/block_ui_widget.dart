import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/loaders/brand_loader.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';

class BlockUiWidget extends StatelessWidget {

  const BlockUiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: colors.secondary.withValues(alpha: 0),
        elevation: 0,
        child: Center(
          child: BrandLoader(
            width: context.screenWidth*0.4,
            height: context.screenWidth*0.4
          ),
        ),
      ),
    );
  }
}

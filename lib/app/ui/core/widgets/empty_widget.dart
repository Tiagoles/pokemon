import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      color: colors.surface.withValues(alpha: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            width: double.infinity,
            height: 320,
            fit: BoxFit.contain,
            'assets/svg/empty.svg',
            semanticsLabel: 'Imagem de diretório vazio'
          ),
          Text(
            'Nenhum registro',
            style: textTheme.bodyLarge!.apply(color: colors.outline),
          ),
          Text(
            textAlign: TextAlign.center,
            'ENCONTRADO',
            style: textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}

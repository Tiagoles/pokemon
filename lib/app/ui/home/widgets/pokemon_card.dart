import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';

class PokemonCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String type;
  final int id;

  const PokemonCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.type,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final (colors, customColors) = (context.colors, context.customColors);
    return Card(
      elevation: 6,
      color: customColors.success.colorContainer,
      shadowColor: Colors.grey.withAlpha(300),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "#$id",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: customColors.success.onColorContainer,
                ),
              ),
            ),

            Center(
              child: SvgPicture.network(
                imageUrl,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(
                color: customColors.success.onColorContainer,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: customColors.info.colorContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                type,
                style: TextStyle(
                  color: customColors.info.onColorContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

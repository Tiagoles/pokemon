import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';
import '../../../domain/enums/pokemon/pokemon_type.dart';

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
    final type = PokemonType.getType(this.type);
    return Card(
      elevation: 6,
      color: type.color,
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
                  color: Color.alphaBlend(
                    Colors.black.withValues(alpha: 0.6),
                    type.color,
                  ),
                ),
              ),
            ),

            if (imageUrl.isNotEmpty)
              Center(
                child: SvgPicture.network(
                  imageUrl,
                  errorBuilder:
                      (context, exception, param) =>
                          Icon(TablerIcons.photo_off),
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
            const SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(
                color: Color.alphaBlend(
                  Colors.white.withValues(alpha: 0.8),
                  type.color,
                ),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Color.alphaBlend(
                  Colors.white.withValues(alpha: 0.3),
                  type.color,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                type.desc,
                style: TextStyle(
                  color: Color.alphaBlend(
                    Colors.black.withValues(alpha: 0.6),
                    type.color,
                  ),
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

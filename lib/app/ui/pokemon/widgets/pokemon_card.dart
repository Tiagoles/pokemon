import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:treinamento_flutter/app/domain/entities/pokemon/pokemon.dart';
import 'package:treinamento_flutter/app/domain/enums/pokemon/pokemon_type.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';
import 'pokemon_card_label.dart';

class PokemonCard extends StatelessWidget {

  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final (colors, customColors) = (context.colors, context.customColors);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              Text(pokemon.name, style: textTheme.titleLarge!.copyWith(
                color: colors.onInverseSurface,
                fontWeight: FontWeight.bold
              )),
              Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: pokemon.types.map(
                        (type) => PokemonCardLabel(text: type)
                ).toList(),
              )
            ],
          ),
          if(pokemon.photo != null) Expanded(child: Align(
            alignment: Alignment.centerRight,
            child: SvgPicture.network(
              pokemon.photo!,
              height: 120,
              fit: BoxFit.contain,
            ),
          ))
        ],
      ),
    );
  }

  Color get color{
    return PokemonType.values.firstWhereOrNull((e) => e.name == pokemon.type)?.color ?? Colors.grey;
  }

}

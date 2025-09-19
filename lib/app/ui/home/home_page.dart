import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/layouts/simple_bar_layout.dart';
import 'package:treinamento_flutter/app/ui/home/widgets/pokemon_card.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';
import '../pokemon/viewmodel/pokemon_view_model.dart';

class HomePage extends StatelessWidget {
  final PokemonViewModel pokemonViewModel;

  const HomePage({super.key, required this.pokemonViewModel});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return SimpleBarLayout(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              spacing: 24,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pokedéx', style: textTheme.displayMedium),
                Text(
                  'Procure por pokémons por nome ou usando o número da Pokédex',
                  style: textTheme.labelMedium,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListenableBuilder(
              listenable: pokemonViewModel.syncCommand,
              builder: (context, _) {
                if (pokemonViewModel.syncCommand.completed) {
                  return ListView.builder(
                    itemCount: pokemonViewModel.pokemons.value.length,
                    itemBuilder: (context, index) {
                      final p = pokemonViewModel.pokemons.value[index];
                      return PokemonCard(
                        name: p.name,
                        id: p.number,
                        type: p.type,
                        imageUrl: p.photo ?? '',
                      );
                    },
                  );
                }
                if (pokemonViewModel.syncCommand.error) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: context.colors.error.withAlpha(50),
                          border: Border.all(
                            color: context.colors.errorContainer,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          pokemonViewModel.syncCommand.errorMessage ??
                              'Erro ao carregar pokémons',
                          style: textTheme.bodyMedium!.copyWith(
                            color: context.colors.error,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return Center(child: const CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:treinamento_flutter/app/domain/entities/pokemon/pokemon.dart';
import 'package:treinamento_flutter/app/plugins/toastr_service.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/layouts/simple_bar_layout.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/menu/app_bar/app_bar_widget.dart';
import 'package:treinamento_flutter/app/ui/pokemon/viewmodel/pokemon_viewmodel.dart';
import 'package:treinamento_flutter/app/ui/pokemon/widgets/pokemon_card.dart';

class HomePage extends StatefulWidget {

  final Map<String, String>? queryParams;
  final PokemonViewModel pokemonViewModel;

  const HomePage({
    super.key,
    this.queryParams,
    required this.pokemonViewModel,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final searchControl = FormControl.text(initialValue: null);
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    searchControl.valueNotifier.addListener(() {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 300), () {
        widget.pokemonViewModel.filter(searchControl.value);
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handlerError(Modular.args.queryParams);
    });
  }

  void _handlerError(Map<String, String>? queryParams){
    if(!mounted) return;
    if(queryParams != null && queryParams.isNotEmpty){
      if(queryParams['error'] != null){
        final String error = queryParams['error']!;
        switch(error){
          case 'unauthorized':
            ToastrService.error(context: context, message: 'Seu usuário não tem permissão para realizar esta ação.');
            break;
          case 'without_pda_and_admin':
            ToastrService.error(context: context, message: 'É necessário configurar o número do PDA para acessar esta página.'
                'Por favor, solicite a uma pessoa com privilégios de acesso que realize essa ação para você.');
            break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return SimpleBarLayout(
      onRefresh: null,
      appBar: const AppBarWidget(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            child: Column(
                spacing: 24,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pokedéx', style: textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
                  Text(
                    'Procure por Pokémons por nome ou usando o número da Pokédex',
                    style: textTheme.labelMedium,
                  ),
                  StyledFormField(
                    control: searchControl,
                    prefixIcon: TablerIcons.search,
                    hintText: 'Nome ou número',
                    type: TextInputType.webSearch,
                  )
                ]
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: widget.pokemonViewModel.state,
              builder: (context, state, _){
                return PagedListView.separated(
                  state: state,
                  fetchNextPage: widget.pokemonViewModel.fetchNextPageCommand.execute,
                  padding: EdgeInsets.all(8),
                  separatorBuilder: (_, index){
                    return const SizedBox(height: 8);
                  },
                  builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (context, Pokemon item, index){
                        return PokemonCard(
                            pokemon: item
                        );
                      }
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
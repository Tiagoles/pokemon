import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:result_dart/result_dart.dart';
import 'package:treinamento_flutter/app/domain/entities/core/lov_entity.dart';
import 'package:treinamento_flutter/app/plugins/toastr_service.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/cards/dynamic_card/dynamic_card_skeleton_widget.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/cards/lov_card/lov_card_widget.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/empty_widget.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/form_fields/text_inputs/styled_text_field_widget.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/shapes/drag_down_shape_widget.dart';
import 'package:treinamento_flutter/app/utils/extensions/exception_extension.dart';

class SearchModalWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? title;
  final bool enabled;
  final ValueChanged<LovEntity> onSelected;
  final AsyncResult<List<LovEntity>> Function(String) onSearch;

  const SearchModalWidget({
    super.key,
    this.title,
    required this.controller,
    required this.hintText,
    this.enabled = true,
    required this.onSelected,
    required this.onSearch,
  });

  @override
  State<SearchModalWidget> createState() => _SearchModalWidgetState();
}

class _SearchModalWidgetState extends State<SearchModalWidget> {

  late bool _isLoading = false;
  late List<LovEntity>? _data = [];

  @override
  void initState() {
    super.initState();
  }

  void _loadData(value) async {

    setState(() {
      _isLoading = true;
    });

    final result = await widget.onSearch(value);

    result.fold(
            (value){
              setState(() {
                _isLoading = false;
                _data = value;
              });
        },
            (error){
              setState(() {
                _isLoading = false;
                _data = [];
              });
              if(mounted){
                ToastrService.error(
                    context: context,
                    confirmText: 'Tentar Novamente',
                    onConfirm: (){
                      _loadData(value);
                    },
                    cancelText: 'Cancelar',
                    message: error.message
                );
              }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: colors.surfaceContainerLowest,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              const DragDownShapeWidget(),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16),
                child: StyledTextFieldWidget(
                  hintText: widget.hintText,
                  enabled: widget.enabled,
                  prefixIcon: TablerIcons.search,
                  textInputAction: TextInputAction.search,
                  onSubmitted: _loadData,
                  controller: widget.controller,
                ),
              ),
              if (widget.title != null) ...[
                Text(
                  widget.title!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
              Expanded(
                child: _getList(context),
              ),
            ],
          ),
        )
    );
  }

  Widget _getList(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    if (_isLoading) {
      return SingleChildScrollView(
        child: Column(
          children: List.generate(4, (index) => const DynamicCardSkeletonWidget()),
        ),
      );
    }
    if (_data == null ||_data!.isEmpty) {
      return const EmptyWidget();
    }
    return ListView.builder(
      itemCount: _data?.length,
      itemBuilder: (context, index) {
        return LovCardWidget(
          onSelected: widget.onSelected,
          leading: Icon(
            TablerIcons.home,
            color: colors.primary,
            size: 16,
          ),
          index: index.toString(),
          title: 'Item ${index + 1}',
          data: _data![index],
        );
      },
    );
  }
}

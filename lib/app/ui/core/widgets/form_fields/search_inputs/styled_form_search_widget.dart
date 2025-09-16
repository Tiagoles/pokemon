import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:result_dart/result_dart.dart';
import 'package:treinamento_flutter/app/domain/entities/core/lov_entity.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/modals/modals.d.dart';

class StyledFormSearchWidget extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController fieldController;
  final TextEditingController searchController;
  final String? Function(String?)? validator;
  final int? maxLines;
  final String? modalTitle;
  final int? minLines;
  final TextInputType type;
  final bool enabled;
  final bool required;
  final ValueChanged<LovEntity> onSelected;
  final AsyncResult<List<LovEntity>> Function(String) onSearch;

  const StyledFormSearchWidget({
    required this.labelText,
    required this.fieldController,
    required this.searchController,
    this.required = false,
    this.hintText = '',
    this.modalTitle,
    this.validator,
    this.maxLines,
    this.minLines,
    this.enabled = true,
    this.type = TextInputType.text,
    required this.onSelected,
    required this.onSearch,
    super.key,
  });

  @override
  State<StyledFormSearchWidget> createState() => _StyledFormSearchWidgetState();
}

class _StyledFormSearchWidgetState extends State<StyledFormSearchWidget> {

  void openSearchModal() {
    FocusScope.of(context).unfocus();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SearchModalWidget(
          onSelected: (selectedData) {
            widget.fieldController.text = selectedData.fieldText;
            widget.onSelected(selectedData);
            Navigator.pop(context);
            FocusScope.of(context).unfocus();
          },
          onSearch: widget.onSearch,
          controller: widget.searchController,
          hintText: widget.hintText,
          enabled: widget.enabled,
          title: widget.modalTitle,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    final colors = appTheme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(required: widget.required, text: widget.labelText),
        const SizedBox(height: 8.0),
        TextFormField(
          onTap: openSearchModal,
          readOnly: true,
          controller: widget.fieldController,
          validator: widget.validator,
          maxLines: 1,
          minLines: widget.minLines,
          keyboardType: widget.type,
          enabled: widget.enabled,
          style: appTheme.textTheme.labelLarge!.copyWith(color: colors.outline),
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.enabled ? colors.surfaceContainerLowest : colors.surface,
            contentPadding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: colors.outline,
            ),
            prefixIcon: Icon(TablerIcons.search, color: colors.outline, size: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: colors.surfaceContainerHigh,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: colors.surfaceContainerHigh,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: colors.outline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

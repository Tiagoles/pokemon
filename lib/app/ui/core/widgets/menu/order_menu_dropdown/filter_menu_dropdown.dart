import 'package:flutter/material.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import 'filter_menu_dropdown_options.dart';

class FilterMenuDropdown extends StatefulWidget {
  final Function(String value)? onChange;
  const FilterMenuDropdown({super.key, this.onChange});

  @override
  State<FilterMenuDropdown> createState() => _FilterMenuDropdownState();

}

class _FilterMenuDropdownState extends State<FilterMenuDropdown> {

  final dropdownController = DropdownController<String>();
  List<CoolDropdownItem<String>> dropdownItemList = [];

  @override
  void initState() {
    for (var e in FilterMenuDropdownOption.values) {
      dropdownItemList.add(CoolDropdownItem(
        label: e.title,
        value: e.name,
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: CoolDropdown<String>(
        controller: dropdownController,
        dropdownList: dropdownItemList,
        defaultItem: dropdownItemList.first,
        onChange: (value) {
          widget.onChange?.call(value);
          dropdownController.close();
        },
        resultOptions: ResultOptions(
          render: ResultRender.label,
          mainAxisAlignment: MainAxisAlignment.end,
          padding: const EdgeInsets.all(12),
          width: 150,
          space: 16,
          openBoxDecoration: BoxDecoration(
            color: colors.primary.withValues(alpha:0),
          ),
          textStyle: textTheme.labelMedium!.apply(color: colors.primary),
          boxDecoration: BoxDecoration(
            color: colors.surface.withValues(alpha: 0),
          ),
          icon: Icon(
        TablerIcons.caret_down_filled,
            size: 16,
            color: colors.primary,
          ),
        ),
        dropdownOptions: DropdownOptions(
          color: colors.surfaceContainerLowest,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(color: colors.outline.withValues(alpha: 0.5)),
        ),
        dropdownItemOptions: DropdownItemOptions(
          textStyle: textTheme.labelMedium!.apply(color: colors.onSurfaceVariant),
          selectedTextStyle: textTheme.labelMedium!.apply(color: colors.onSurfaceVariant),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          boxDecoration: BoxDecoration(
            color: colors.primary.withValues(alpha: 0)
          ),
          selectedBoxDecoration: BoxDecoration(
            color: colors.outlineVariant.withValues(alpha: 0.3),
          ),
        ),
      ),
    );
  }
}

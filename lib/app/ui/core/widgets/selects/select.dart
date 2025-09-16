import 'package:dart_ng_forms/widgets/control_value_acessor.dart';
import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';

class Option<T> {
  final T value;
  final String label;

  Option(this.value, this.label);
}

class Select<T> extends ControlValueAcessor<T?, T?> {
  final List<Option<T>> options;
  final ValueChanged<T?>? onChanged;
  final String? placeholder;
  final IconData? icon;
  final String label;

  const Select({
    super.key,
    required this.options,
    required this.label,
    super.formGroup,
    super.name,
    super.control,
    this.onChanged,
    super.validator,
    this.placeholder,
    this.icon,
    super.required,
    super.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: changeNotifier,
      builder: (context, _){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Label(required: isRequired, text: label),
            const SizedBox(height: 8),
            DropdownButtonFormField<T>(
              value: value,
              isExpanded: true,
              items: items,
              onChanged: !isDisabled
                  ? (newValue) {
                value = newValue;
                onChanged?.call(newValue);
              }
                  : null,
              validator: validator,
              dropdownColor: context.colors.surfaceContainerLowest,
              hint: Text(placeholder ?? 'Selecione'),
              decoration: InputDecoration(
                filled: true,
                errorMaxLines: 3,
                fillColor: !isDisabled
                    ? context.colors.surfaceContainerLowest
                    : context.colors.surface,
                contentPadding:
                const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                prefixIcon: icon != null ? Icon(icon, size: 16) : null,
                prefixIconColor: context.colors.outline,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: context.colors.surfaceContainerHigh,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: context.colors.surfaceContainerHigh,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: context.colors.outline,
                  ),
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: context.textTheme.labelLarge!.apply(
                color: context.colors.outline,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        );
      },
    );
  }

  List<DropdownMenuItem<T>> get items => options.map((opt){
    return DropdownMenuItem<T>(
        value: opt.value,
        child: Text(opt.label)
    );
  }).toList();

}

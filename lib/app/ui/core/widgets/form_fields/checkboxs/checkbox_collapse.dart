import 'package:dart_ng_forms/widgets/control_value_acessor.dart';
import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';

class CheckboxCollapse extends ControlValueAcessor<bool, bool> {

  final String? label;
  final Widget content;

  const CheckboxCollapse({
    super.key,
    required this.content,
    super.control,
    super.formGroup,
    super.name,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: changeNotifier,
      builder: (context, _) {
        final colors = context.colors;
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colors.surfaceContainerLowest,
            border: Border.all(color: colors.surfaceContainerHighest),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyledCheckboxWidget(
                label: label,
                control: control,
                onChanged: (newValue){
                  value = newValue ?? false;
                },
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: child(context),
              )
            ],
          ),
        );
    });
  }

  Widget child(BuildContext context){
    if(value){
      return Column(
        children: [
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: context.colors.surfaceContainerHighest),
            ),
            child: content,
          )
        ],
      );
    }
    return const SizedBox.shrink();
  }

}

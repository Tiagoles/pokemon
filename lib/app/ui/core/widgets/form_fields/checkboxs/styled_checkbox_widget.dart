import 'package:dart_ng_forms/widgets/control_value_acessor.dart';
import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';

class StyledCheckboxWidget extends ControlValueAcessor<bool, bool> {
  final String? label;
  final ValueChanged<bool?>? onChanged;

  const StyledCheckboxWidget({
    this.label,
    super.enabled,
    super.required,
    super.validator,
    super.formGroup,
    super.name,
    super.control,
    this.onChanged,
    super.key,
  });

  void _toggleCheckbox(BuildContext context) {
    value = !value;
    onChanged?.call(value);
  }


  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    return ListenableBuilder(
      listenable: changeNotifier,
      builder: (context, _){
        final error = this.error;
        return GestureDetector(
          onTap: () => _toggleCheckbox(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: 0.65,
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        border: Border.all(color: error != null ? colors.error : colors.primary, width: 2),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors.transparent,
                        ),
                        child: Checkbox(
                          value: value,
                          onChanged: (newValue){
                            value = newValue ?? false;
                            onChanged?.call(newValue);
                          },
                          activeColor: Colors.transparent,
                          side: BorderSide.none,
                          focusColor: Colors.transparent,
                          checkColor: colors.primary,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 0),
                  if(label != null)
                    Expanded(child: Label(
                      text: label!,
                      error: !isValid,
                    )),
                ],
              ),
              if (error != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    error,
                    style: textTheme.bodySmall?.copyWith(
                      color: colors.error,
                    ),
                  ),
                ),
            ],
          ),
        );
      }
    );
  }
}
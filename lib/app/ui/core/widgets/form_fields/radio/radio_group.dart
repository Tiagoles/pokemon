import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/form_fields/form_fields.d.dart';

class RadioGroupOption<T> {
  final String title;
  final T value;
  final String? subtitle;

  RadioGroupOption({required this.title, required this.value, this.subtitle});
}

class RadioGroup<T> extends StatelessWidget {
  final String? label;
  final List<RadioGroupOption<T>> options;
  final ValueNotifier<T?>? model;
  final bool enabled;
  final bool required;
  final String? Function(T?)? validator;
  final FormGroup? formGroup;
  final String? name;

  const RadioGroup({
    super.key,
    required this.options,
    this.enabled = true,
    this.required = false,
    this.label,
    this.model,
    this.validator,
    this.formGroup,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _){
        final errorText = validator?.call(value);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(label != null) Label(text: label!),
            Column(
              children: options.map((option) {
                return RadioListTile<T>(
                  value: option.value,
                  groupValue: value,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  dense: true,
                  onChanged: (val) => value = val,
                  title: Label(text: option.title),
                  subtitle: option.subtitle != null
                      ? Text(option.subtitle!)
                      : null,
                );
              }).toList(),
            ),
            if (errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  errorText,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
          ],
        );
    });
  }

  ChangeNotifier get controller{
    if(model != null) return model!;
    if(formGroup != null && name != null){
      return formGroup!.control(name!);
    }
    throw Exception('RadioGroup: model or formGroup and name must be provided');
  }

  T? get value{
    if(model != null) return model!.value;
    if(formGroup != null && name != null){
      return formGroup!.control(name!).value;
    }
    throw Exception('RadioGroup: model or formGroup and name must be provided');
  }

  set value(T? val){
    if(model != null){
      model!.value = val;
      return;
    }
    if(formGroup != null && name != null){
      formGroup!.control(name!).setValue(val);
      return;
    }
    throw Exception('RadioGroup: model or formGroup and name must be provided');
  }

  bool get isDisabled{
    if(formGroup != null && name != null){
      return formGroup!.control(name!).isDisabled;
    }
    return enabled;
  }

  bool get isRequired{
    if(formGroup != null && name != null){
      return formGroup!.control(name!).isRequired;
    }
    return required;
  }

  FormFieldValidator<T?>? get formValidator{
    if(formGroup != null && name != null){
      return formGroup!.control(name!).validator;
    }
    return validator;
  }

}

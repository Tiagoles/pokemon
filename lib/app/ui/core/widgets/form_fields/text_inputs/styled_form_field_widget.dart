import 'package:dart_ng_forms/widgets/control_value_acessor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/form_fields/text_inputs/styled_password_field_widget.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/form_fields/text_inputs/styled_text_field_widget.dart';

class StyledFormField extends ControlValueAcessor<TextEditingValue, String> {

  final String? labelText;
  final String hintText;
  final BorderRadius borderRadius;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final List<TextInputFormatter> formatters;
  final int? maxLines;
  final int? minLines;
  final TextInputType type;

  const StyledFormField({
    super.control,
    super.formGroup,
    super.name,
    this.labelText,
    this.prefix,
    this.suffix,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
    super.required,
    this.hintText = '',
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    super.validator,
    this.maxLines,
    this.minLines,
    super.enabled,
    this.formatters = const [],
    this.type = TextInputType.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(labelText != null) ...[
          Label(required: isRequired, text: labelText!),
          const SizedBox(height: 8.0)
        ],
        _getTextFieldByType(),
      ],
    );
  }

  Widget _getTextFieldByType(){
    switch(type){
      case TextInputType.visiblePassword:
        return StyledPasswordFieldWidget(
          controller: textController,
          enabled: enabled,
          hintText: hintText,
          validator: validator,
          formatters: formatters,
        );
      default:
        return StyledTextFieldWidget(
          controller: textController,
          maxLines: maxLines,
          prefixContent: prefix,
          suffixContent: suffix,
          borderRadius: borderRadius,
          type: type,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          formatters: formatters,
          enabled: enabled,
          minLines: minLines,
          hintText: hintText,
          validator: validator,
          obscureText: obscureText,
        );
    }
  }
}

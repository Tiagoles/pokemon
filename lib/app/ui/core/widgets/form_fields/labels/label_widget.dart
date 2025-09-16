import 'package:flutter/material.dart';

import 'non_required_label_widget.dart';
import 'required_label_widget.dart';

class Label extends StatelessWidget {

  final bool required;
  final String text;
  final bool error;

  const Label({
    super.key,
    this.required = false,
    required this.text,
    this.error = false
  });

  @override
  Widget build(BuildContext context) {
    return required ? RequiredLabel(text: text, error: error) : NonRequiredLabel(text: text, error:error);
  }
}

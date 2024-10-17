import 'package:flutter/material.dart';
import 'package:template_app/common/extensions/string_extensions.dart';
import 'package:template_app/common/themes/texts_theme.dart';

class TextFormFieldTypeString extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Function(String value) onSave;

  const TextFormFieldTypeString({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        style: TextsTheme.styleInputDecorationDefault,
        controller: controller,
        validator: (value) => (value!.trim().isEmpty) ? labelText : null,
        onSaved: (newValue) => onSave(newValue!.trim().capitalize()),
        maxLength: 50,
        autocorrect: false,
        decoration: InputDecoration(
          counterText: "",
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }
}

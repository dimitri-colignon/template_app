import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template_app/common/themes/texts_theme.dart';

class TextFormFieldTypeInt extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Function(int value) onSave;

  const TextFormFieldTypeInt({
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
        validator: (value) {
          return (value!.trim().isEmpty)
              ? labelText
              : (int.tryParse(value) == null)
                  ? labelText
                  : null;
        },
        onSaved: (newValue) => onSave(int.parse(newValue!)),
        maxLength: 10,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
        ],
        autocorrect: false,
        decoration: InputDecoration(
          counterText: "",
          labelText: labelText,
          hintText: hintText,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

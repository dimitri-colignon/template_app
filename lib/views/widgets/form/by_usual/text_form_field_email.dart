import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/themes/texts_theme.dart';

class TextFormFieldEmail extends StatelessWidget {
  final Function(String email) onSave;

  const TextFormFieldEmail({
    super.key,
    required this.onSave,
  });

  String? _validateEmail(String? value) {
    const String pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final RegExp regex = RegExp(pattern);
    return value!.trim().isEmpty || !regex.hasMatch(value.trim()) ? TextsConstant.kFormValidator.replaceFirst("%1", TextsConstant.kEmail) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        style: TextsTheme.styleInputDecorationDefault,
        validator: (value) => _validateEmail(value),
        onSaved: (newValue) => onSave(newValue!.trim()),
        maxLength: 50,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp("[0-9@a-zA-Z.]")),
        ],
        autocorrect: false,
        decoration: InputDecoration(
          counterText: "",
          labelText: TextsConstant.kFormLabel.replaceFirst("%1", TextsConstant.kEmail),
          hintText: TextsConstant.kEmail,
          prefixIcon: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(FontAwesomeIcons.at, size: 20.0),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}

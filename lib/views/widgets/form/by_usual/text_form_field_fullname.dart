import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/themes/texts_theme.dart';

class TextFormFieldFullname extends StatelessWidget {
  final Function(String fullName) onSave;

  const TextFormFieldFullname({
    super.key,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        style: TextsTheme.styleInputDecorationDefault,
        validator: (value) => (value!.trim().isEmpty) ? TextsConstant.kFormValidator.replaceFirst("%1", TextsConstant.kFullname) : null,
        onSaved: (newValue) => onSave(newValue!.trim()),
        maxLength: 50,
        autocorrect: false,
        decoration: InputDecoration(
          counterText: "",
          labelText: TextsConstant.kFormLabel.replaceFirst("%1", TextsConstant.kFullname),
          hintText: TextsConstant.kFullname,
          prefixIcon: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(FontAwesomeIcons.solidUser, size: 20.0),
          ),
        ),
      ),
    );
  }
}

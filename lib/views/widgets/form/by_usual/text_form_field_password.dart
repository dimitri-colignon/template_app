import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/themes/colors_theme.dart';
import 'package:template_app/common/themes/texts_theme.dart';

class TextFormFieldPassword extends StatefulWidget {
  final Function(String password) onSave;

  const TextFormFieldPassword({
    super.key,
    required this.onSave,
  });

  @override
  State<TextFormFieldPassword> createState() => _TextFormFieldPasswordState();
}

class _TextFormFieldPasswordState extends State<TextFormFieldPassword> {
  bool _obscureTextPassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        style: TextsTheme.styleInputDecorationDefault,
        validator: (value) => (value!.trim().isEmpty) ? TextsConstant.kFormValidator.replaceFirst("%1", TextsConstant.kPassword) : null,
        onSaved: (newValue) => widget.onSave(newValue!.trim()),
        maxLength: 25,
        autocorrect: false,
        obscureText: _obscureTextPassword,
        decoration: InputDecoration(
          counterText: "",
          labelText: TextsConstant.kFormLabel.replaceFirst("%1", TextsConstant.kPassword),
          hintText: TextsConstant.kPassword,
          prefixIcon: const Padding(
            padding: EdgeInsets.all(10.0),
            child: FaIcon(FontAwesomeIcons.key),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () => setState(() => _obscureTextPassword = !_obscureTextPassword),
              child: FaIcon(_obscureTextPassword ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash, color: ColorsTheme.kBlueLight),
            ),
          ),
        ),
      ),
    );
  }
}

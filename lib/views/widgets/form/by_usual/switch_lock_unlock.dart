import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:template_app/common/themes/colors_theme.dart';
import 'package:template_app/common/themes/texts_theme.dart';

class SwitchLockUnlock extends StatelessWidget {
  final bool active;
  final String labelText;
  final Function(bool value) onChanged;

  const SwitchLockUnlock({
    super.key,
    required this.active,
    required this.labelText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(labelText, style: TextsTheme.styleInputDecorationDefault),
          Switch(
            value: active,
            onChanged: (value) => onChanged(value),
            thumbIcon: WidgetStateProperty.resolveWith<Icon?>((Set<WidgetState> states) {
              return (states.contains(WidgetState.selected)) ? const Icon(FontAwesomeIcons.unlock, color: ColorsTheme.kGreen) : const Icon(FontAwesomeIcons.lock, color: ColorsTheme.kRed);
            }),
            trackColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
              return (states.contains(WidgetState.selected)) ? ColorsTheme.kGreen : ColorsTheme.kRed;
            }),
            trackOutlineColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
              return (states.contains(WidgetState.selected)) ? ColorsTheme.kGreen : ColorsTheme.kRed;
            }),
            thumbColor: const WidgetStatePropertyAll(ColorsTheme.kOnPrimary),
          ),
        ],
      ),
    );
  }
}

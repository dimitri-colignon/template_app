import 'package:flutter/material.dart';
import 'package:template_app/common/extensions/string_extensions.dart';
import 'package:template_app/common/themes/colors_theme.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final void Function() onTap;

  const MenuCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const Border(left: BorderSide(color: ColorsTheme.kPrimary, width: 5.0)),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 15.0),
        title: Text(title.capitalize()),
        trailing: Container(
          width: 40.0,
          alignment: Alignment.centerRight,
          decoration: const BoxDecoration(
            color: ColorsTheme.kPrimary,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(45.0), bottomLeft: Radius.circular(45.0)),
          ),
          child: const Icon(Icons.arrow_right, color: ColorsTheme.kOnPrimary, size: 32.0),
        ),
        onTap: () => onTap(),
      ),
    );
  }
}

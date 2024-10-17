import 'package:flutter/material.dart';
import 'package:template_app/common/extensions/string_extensions.dart';
import 'package:template_app/common/themes/colors_theme.dart';

class WindowCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const WindowCard({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: ColorsTheme.kPrimary, width: 2.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: const BoxDecoration(
              color: ColorsTheme.kPrimary,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
            ),
            child: Text(title.capitalize(), style: const TextStyle(color: ColorsTheme.kOnPrimary, fontSize: 16.0, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}

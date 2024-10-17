import 'package:flutter/material.dart';
import 'package:template_app/common/extensions/string_extensions.dart';
import 'package:template_app/views/widgets/divers/bullet.dart';

class WindowItemInfoCard extends StatelessWidget {
  final String itemKey;
  final String itemValue;

  const WindowItemInfoCard({
    super.key,
    required this.itemKey,
    required this.itemValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Bullet(),
              Text(itemKey.capitalize()),
            ],
          ),
          Text(itemValue),
        ],
      ),
    );
  }
}

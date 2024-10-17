import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:template_app/common/extensions/string_extensions.dart';
import 'package:template_app/common/themes/colors_theme.dart';
import 'package:template_app/services/launcher_service.dart';
import 'package:template_app/views/widgets/divers/bullet.dart';

class WindowItemLinkCard extends StatelessWidget {
  final String name;
  final Uri url;

  const WindowItemLinkCard({
    super.key,
    required this.name,
    required this.url,
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
              Text(name.capitalize()),
            ],
          ),
          InkWell(
            onTap: () => LauncherService.launchUri(context: context, url: url),
            child: const FaIcon(FontAwesomeIcons.globe, color: ColorsTheme.kBlueLight, size: 20.0),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/themes/colors_theme.dart';
import 'package:template_app/common/themes/texts_theme.dart';

class SearchTextFieldAppBar extends StatefulWidget {
  final Function(String value) onSubmitted;

  const SearchTextFieldAppBar({
    super.key,
    required this.onSubmitted,
  });

  @override
  State<SearchTextFieldAppBar> createState() => _SearchTextFieldAppBarState();
}

class _SearchTextFieldAppBarState extends State<SearchTextFieldAppBar> {
  final TextEditingController _searchController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20.0,
      top: 42.5,
      right: 115.0,
      child: SizedBox(
        height: 45.0,
        child: TextField(
          style: TextsTheme.styleInputDecorationDefault,
          controller: _searchController,
          maxLength: 50,
          decoration: InputDecoration(
            fillColor: ColorsTheme.kGreyLight.withOpacity(0.75),
            counterText: "",
            hintText: TextsConstant.kFormEnterText,
            prefixIcon: GestureDetector(
              onTap: () => widget.onSubmitted(_searchController.text),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: FaIcon(FontAwesomeIcons.magnifyingGlass, color: ColorsTheme.kBlack),
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () => _searchController.text = "",
              child: const Padding(
                padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
                child: FaIcon(FontAwesomeIcons.xmark, color: ColorsTheme.kBlack),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

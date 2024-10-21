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
      top: 45.0,
      right: 115.0,
      child: SizedBox(
        height: 40.0,
        child: TextField(
          //onSubmitted: (value) => widget.onSubmitted(value),
          style: TextsTheme.styleInputDecorationDefault,
          controller: _searchController,
          maxLength: 50,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            fillColor: ColorsTheme.kGreyLight.withOpacity(0.75),
            counterText: "",
            hintText: TextsConstant.kFormEnterText,
            prefixIcon: Container(
              width: 26.0,
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => widget.onSubmitted(_searchController.text),
                child: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: ColorsTheme.kBlack,
                  size: 20.0,
                ),
              ),
            ),
            suffixIcon: Container(
              width: 26.0,
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  _searchController.text = "";
                  widget.onSubmitted("");
                },
                child: const Icon(
                  FontAwesomeIcons.xmark,
                  color: ColorsTheme.kBlack,
                  size: 20.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

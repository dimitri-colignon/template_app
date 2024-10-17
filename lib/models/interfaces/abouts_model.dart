import 'package:template_app/common/constants/abouts_constant.dart';
import 'package:template_app/common/constants/texts_constant.dart';

class AboutsModel {
  final String key;
  final String value;

  AboutsModel({
    required this.key,
    required this.value,
  });
}

final List<AboutsModel> listAbouts = [
  AboutsModel(key: TextsConstant.kAppName, value: AboutsConstant.kAppName),
  AboutsModel(key: TextsConstant.kAppVersion, value: AboutsConstant.kAppVersion),
  AboutsModel(key: TextsConstant.kAppDate, value: AboutsConstant.kAppDate),
  AboutsModel(key: TextsConstant.kAppAuthorName, value: AboutsConstant.kAppAuthorName),
  // ...
];

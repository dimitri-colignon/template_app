import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:template_app/common/constants/texts_constant.dart';

class EnvConfiguration {
  // ***
  // !!! Si vous venez de télécharger l'app de github,
  // changez le nom des fichiers.
  // (.env.development_example => .env.development)
  // ***

  static const String _kEnvProduction = ".env/.env.production";
  static const String _kEnvDevelopment = ".env/.env.development";

  static String get fileName {
    if (kReleaseMode) return _kEnvProduction;
    return _kEnvDevelopment;
  }

  // ***
  // Exemples ...
  // ***

  static const String _kApiKey = "API_KEY";
  static const String _kApiBaseUrl = "API_BASE_URL";
  static const String _kGoogleApiKey = "MAPS_API_KEY";

  static String get apiKey => dotenv.env[_kApiKey] ?? TextsConstant.kDataNotFound.replaceFirst("%1", _kApiKey);
  static String get apiBaseUrl => dotenv.env[_kApiBaseUrl] ?? TextsConstant.kDataNotFound.replaceFirst("%1", _kApiBaseUrl);
  static String get googleApiKey => dotenv.env[_kGoogleApiKey] ?? TextsConstant.kDataNotFound.replaceFirst("%1", _kGoogleApiKey);

  // ***
}

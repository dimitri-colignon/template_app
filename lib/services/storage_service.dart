import 'package:get_storage/get_storage.dart';

class StorageService {
  StorageService._();

  static const String kUserConnected = "userConnected";

  static Future<void> init() async => await GetStorage.init();
  static Future<void> clear() async => await GetStorage().erase();

  static Future<void> setString({required String key, required String value}) async => await GetStorage().write(key, value);
  static String? getString({required String key}) => GetStorage().read(key);

  static Future<void> setBool({required String key, required bool value}) async => await GetStorage().write(key, value);
  static bool? getBool({required String key}) => GetStorage().read(key);

  static Future<void> setInt({required String key, required int value}) async => await GetStorage().write(key, value);
  static int? getInt({required String key}) => GetStorage().read(key);

  static Future<void> setDouble({required String key, required double value}) async => await GetStorage().write(key, value);
  static double? getDouble({required String key}) => GetStorage().read(key);

  static Future<void> removeKey({required String key}) async => await GetStorage().remove(key);
}

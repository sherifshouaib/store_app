import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin StorageHelper {
  Future<bool> saveTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
    return true;
  }

  Future<String?> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? theme = prefs.getString('theme');
    return theme;
  }

  static const _flutterSecureStorage = FlutterSecureStorage();

  static Future<String> getSecretKey() async {
    await _flutterSecureStorage.write(
        key: 'secretKey', value: dotenv.env['SECRETKEY']);

    return await _flutterSecureStorage.read(key: 'secretKey') ?? '';
  }
}

import 'dart:ui' as ui;
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static Future<String> getTargetLanguage() async {
    final p = await SharedPreferences.getInstance();
    return p.getString("lang") ?? ui.window.locale.languageCode;
  }

  static Future setTargetLanguage(String l) async {
    final p = await SharedPreferences.getInstance();
    await p.setString("lang", l);
  }
}

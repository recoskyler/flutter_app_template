import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  // call this method from initState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static String? getString(String key, [String? defValue]) {
    return _prefsInstance?.getString(key) ?? defValue;
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static List<String>? getStringList(String key, [List<String>? defValue]) {
    return _prefsInstance?.getStringList(key) ?? defValue;
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    var prefs = await _instance;
    return prefs.setStringList(key, value);
  }

  static int? getInt(String key, [int? defValue]) {
    return _prefsInstance?.getInt(key) ?? defValue;
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }

  static bool? getBool(String key, [bool? defValue]) {
    return _prefsInstance?.getBool(key) ?? defValue;
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static double? getDouble(String key, [double? defValue]) {
    return _prefsInstance?.getDouble(key) ?? defValue;
  }

  static Future<bool> setDouble(String key, double value) async {
    var prefs = await _instance;
    return prefs.setDouble(key, value);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();
  static SharedPreferences? _prefs;

  SharedPrefs._internal();
  factory SharedPrefs() {
    return _instance;
  }

  /// Initialize SharedPreferences (Call this in `main.dart`)
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save String value
  Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  /// Get String value
  String? getString(String key) {
    return _prefs?.getString(key);
  }

  /// Save Boolean value
  Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  /// Get Boolean value
  bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  /// Save Integer value
  Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  /// Get Integer value
  int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  /// Save Double value
  Future<void> setDouble(String key, double value) async {
    await _prefs?.setDouble(key, value);
  }

  /// Get Double value
  double? getDouble(String key) {
    return _prefs?.getDouble(key);
  }

  /// Save List of Strings
  Future<void> setStringList(String key, List<String> value) async {
    await _prefs?.setStringList(key, value);
  }

  /// Get List of Strings
  List<String>? getStringList(String key) {
    return _prefs?.getStringList(key);
  }

  /// Remove a specific key
  Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  /// Clear all data
  Future<void> clear() async {
    await _prefs?.clear();
  }
}

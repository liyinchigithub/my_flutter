import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPreferencesService {
  static SharedPreferences? _prefs;

  // 初始化SharedPreferences实例
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // 保存字符串
  static Future<void> saveString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  // 读取字符串
  static String? getString(String key) {
    return _prefs?.getString(key);
  }

  // 保存布尔值
  static Future<void> saveBoolean(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  // 读取布尔值
  static bool? getBoolean(String key) {
    return _prefs?.getBool(key);
  }

  // 保存字符串列表
  static Future<void> saveStringList(String key, List<String> value) async {
    await _prefs?.setStringList(key, value);
  }

  // 读取字符串列表
  static List<String>? getStringList(String key) {
    return _prefs?.getStringList(key);
  }

  // 保存字典
  static Future<void> saveMap(String key, Map<String, dynamic> value) async {
    String mapStr = jsonEncode(value);
    await _prefs?.setString(key, mapStr);
  }

  // 读取字典
  static Map<String, dynamic>? getMap(String key) {
    String? mapStr = _prefs?.getString(key);
    return mapStr != null ? jsonDecode(mapStr) : null;
  }
}
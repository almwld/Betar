import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  static late Box _box;
  static bool _initialized = false;

  static Future<void> init() async {
    if (_initialized) return;
    try {
      await Hive.initFlutter();
      _box = await Hive.openBox('flex_yemen_cache');
      _initialized = true;
      debugPrint('LocalStorageService initialized successfully');
    } catch (e) {
      debugPrint('Error initializing LocalStorageService: $e');
    }
  }

  static Future<void> _ensureInitialized() async {
    if (!_initialized) {
      await init();
    }
  }

  static Future<void> setString(String key, String value) async {
    await _ensureInitialized();
    await _box.put(key, value);
  }

  static String? getString(String key) {
    _ensureInitialized();
    return _box.get(key) as String?;
  }

  static Future<void> setBool(String key, bool value) async {
    await _ensureInitialized();
    await _box.put(key, value);
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    _ensureInitialized();
    return _box.get(key) as bool? ?? defaultValue;
  }

  static Future<void> setInt(String key, int value) async {
    await _ensureInitialized();
    await _box.put(key, value);
  }

  static int getInt(String key, {int defaultValue = 0}) {
    _ensureInitialized();
    return _box.get(key) as int? ?? defaultValue;
  }

  static Future<void> setDouble(String key, double value) async {
    await _ensureInitialized();
    await _box.put(key, value);
  }

  static double getDouble(String key, {double defaultValue = 0.0}) {
    _ensureInitialized();
    return _box.get(key) as double? ?? defaultValue;
  }

  static Future<void> setList(String key, List<dynamic> value) async {
    await _ensureInitialized();
    await _box.put(key, value);
  }

  static List<dynamic>? getList(String key) {
    _ensureInitialized();
    return _box.get(key) as List<dynamic>?;
  }

  static Future<void> setMap(String key, Map<String, dynamic> value) async {
    await _ensureInitialized();
    await _box.put(key, value);
  }

  static Map<String, dynamic>? getMap(String key) {
    _ensureInitialized();
    return _box.get(key) as Map<String, dynamic>?;
  }

  static Future<void> remove(String key) async {
    await _ensureInitialized();
    await _box.delete(key);
  }

  static Future<void> clear() async {
    await _ensureInitialized();
    await _box.clear();
  }
}
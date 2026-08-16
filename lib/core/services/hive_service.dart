import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String gameBoxName = 'cipher_game_box';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(gameBoxName);
  }

  static Box get _box => Hive.box(gameBoxName);

  static Future<void> saveData(String key, dynamic value) async {
    await _box.put(key, value);
  }

  static T? getData<T>(String key) {
    return _box.get(key) as T?;
  }

  static Future<void> deleteData(String key) async {
    _box.delete(key);
  }
}
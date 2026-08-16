import 'package:flutter/material.dart';

import 'hive_service.dart';

class LocaleService {
  LocaleService._();

  static const String _localeKey = 'app_locale';
  static final ValueNotifier<Locale?> localeNotifier = ValueNotifier<Locale?>(
    null,
  );

  static Future<void> init() async {
    final code = HiveService.getData<String>(_localeKey);
    if (code == null || code.isEmpty) {
      localeNotifier.value = const Locale('ar');
      return;
    }

    localeNotifier.value = Locale(code);
  }

  static Future<void> toggleLocale() async {
    final currentCode = localeNotifier.value?.languageCode ?? 'ar';
    final nextCode = currentCode == 'ar' ? 'en' : 'ar';
    final nextLocale = Locale(nextCode);

    localeNotifier.value = nextLocale;
    await HiveService.saveData(_localeKey, nextCode);
  }
}

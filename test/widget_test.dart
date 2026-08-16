import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:cipher/features/home/presentation/screens/home_screen.dart';
import 'package:cipher/core/services/hive_service.dart';
import 'package:cipher/core/services/service_locator.dart';
import 'package:cipher/main.dart';

void main() {
  late Directory hiveDir;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    hiveDir = await Directory.systemTemp.createTemp('cipher_hive_test_');
    Hive.init(hiveDir.path);
    await Hive.openBox(HiveService.gameBoxName);

    configureDependencies();
  });

  tearDownAll(() async {
    await Hive.close();
    if (hiveDir.existsSync()) {
      hiveDir.deleteSync(recursive: true);
    }
  });

  testWidgets('Home screen smoke test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1440, 2560);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const CipherApp());
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byIcon(Icons.radar), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/services/hive_service.dart';
import 'core/services/service_locator.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await HiveService.init();
  
  configureDependencies();

  runApp(const CipherApp());
}
class CipherApp extends StatelessWidget {
  const CipherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Cipher - صفر',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          routerConfig: AppRouter.router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('ar'),
        );
      },
    );
  }
}
// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'شفرة - صفر';

  @override
  String get activeDossiers => 'الملفات النشطة';

  @override
  String get systemStatus => 'حالة النظام: متصل. بانتظار اختيار العميل.';

  @override
  String get initiatePlay => 'بدء العملية';

  @override
  String get reveal => 'كشف';

  @override
  String get terminate => 'إنهاء';

  @override
  String get homeLoadError => 'تعذر تحميل الألعاب حاليا.';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get noGamesAvailable => 'لا توجد ألعاب متاحة حاليا.';

  @override
  String get gameCategory => 'خداع';

  @override
  String get activeTag => 'نشط';

  @override
  String get operatives => 'اللاعبون';

  @override
  String get durationLabel => 'المدة';

  @override
  String get gamesTab => 'الألعاب';

  @override
  String get ranksTab => 'الرتب';

  @override
  String get assetsTab => 'الموارد';

  @override
  String get spyfallTitle => 'سباي فول';

  @override
  String get spyfallDescription =>
      'حدد المتسلل قبل انتهاء الوقت. الثقة مسؤولية.';

  @override
  String get spyfallPlayers => '3-8 لاعبين';

  @override
  String get spyfallDuration => '15 دقيقة';

  @override
  String get charadesTitle => 'بروتوكول الحركة';

  @override
  String get charadesDescription =>
      'حلل سيناريوهات سينمائية عالية التأثير لتحقيق أفضلية تكتيكية.';

  @override
  String get charadesPlayers => '4+ لاعبين';

  @override
  String get charadesDuration => '10 دقائق';

  @override
  String get gameUnderConstruction => 'هذه اللعبة قيد التطوير وستتوفر قريبا.';
}

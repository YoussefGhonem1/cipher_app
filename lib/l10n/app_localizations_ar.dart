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
  String get activeDossiers => 'الملفات المتاحة';

  @override
  String get systemStatus => 'حالة النظام: متصل. في انتظار تحديد المهمة.';

  @override
  String get initiatePlay => 'بدء اللعبه';

  @override
  String get reveal => 'كشف الهوية';

  @override
  String get terminate => 'إجهاض المهمة';

  @override
  String get homeLoadError => 'فشل الاتصال بقاعدة البيانات.';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get noGamesAvailable => 'لا توجد مهام متاحة حالياً.';

  @override
  String get gameCategory => 'تخفي وذكاء';

  @override
  String get activeTag => 'متاح';

  @override
  String get operatives => 'العملاء';

  @override
  String get durationLabel => 'المدة';

  @override
  String get gamesTab => 'المهام';

  @override
  String get ranksTab => 'التصنيف';

  @override
  String get assetsTab => 'الموارد';

  @override
  String get spyfallTitle => 'الجاسوس';

  @override
  String get spyfallDescription =>
      'اكشف العميل المندس قبل نفاذ الوقت. إياك أن تثق بأحد.';

  @override
  String get spyfallPlayers => '٣-٨ عملاء';

  @override
  String get spyfallDuration => '١٥ دقيقة';

  @override
  String get charadesTitle => 'أكشن (بدون كلام)';

  @override
  String get charadesDescription =>
      'لعبة بدون كلام الكلاسيكية، مجهزة بمشاهد سينمائية حماسية.';

  @override
  String get charadesPlayers => '+٤ عملاء';

  @override
  String get charadesDuration => '١٠ دقائق';

  @override
  String get gameUnderConstruction => 'المهمة قيد التجهيز، ستكون متاحة قريباً.';

  @override
  String get spyfallMissionParam => 'إعدادات المهمة';

  @override
  String get spyfallOperativesTitle => 'عدد العملاء';

  @override
  String get spyfallLoadError => 'فشل الاتصال بقاعدة البيانات.';

  @override
  String get spyfallSelectOperatives => 'حدد عدد العناصر المشاركة (٣-٨)';

  @override
  String get spyfallMissionDurationTitle => 'مدة المهمة';

  @override
  String get spyfallSelectDuration => 'حدد وقت الاستخراج';

  @override
  String get spyfallInitiateMission => 'بدء المهمة';

  @override
  String spyfallDurationMinutes(int count) {
    return '$count دقائق';
  }

  @override
  String get spyfallPassDevice => 'سلم الجهاز';

  @override
  String spyfallPassToPlayer(int index) {
    return 'سلم الجهاز للعميل رقم $index';
  }

  @override
  String spyfallIAmPlayer(int index) {
    return 'أنا العميل رقم $index';
  }

  @override
  String get spyfallHiddenBriefing => 'الهوية مشفرة';

  @override
  String get spyfallRoleSpy => 'أنت الجاسوس';

  @override
  String get spyfallRoleAgent => 'أنت عميل شريف';

  @override
  String get spyfallRoleNoLocation => 'الوجهة مجهولة';

  @override
  String get spyfallNextPlayer => 'العميل التالي';

  @override
  String get spyfallStartInterrogation => 'بدء الاستجواب';

  @override
  String get spyfallTimeRemaining => 'الوقت المتبقي للانسحاب';

  @override
  String get spyfallPossibleLocations => 'بنك الأهداف (المواقع)';

  @override
  String get spyfallIntelLevelLabel => 'مستوى السرية';

  @override
  String get spyfallLocationEmbassy => 'السفارة';

  @override
  String get spyfallLocationSubmarine => 'الغواصة';

  @override
  String get spyfallLocationResearchLab => 'مختبر الأبحاث';

  @override
  String get spyfallLocationNightclub => 'الملهى الليلي';

  @override
  String get spyfallLocationSecretBase => 'القاعدة السرية';

  @override
  String get spyfallLocationBank => 'البنك';

  @override
  String get spyfallLocationHospital => 'المستشفى';

  @override
  String get spyfallLocationSpaceStation => 'محطة فضاء';

  @override
  String get spyfallLocationPirateShip => 'سفينة قراصنة';

  @override
  String get spyfallLocationCircus => 'السيرك';

  @override
  String get spyfallLocationPoliceStation => 'قسم الشرطة';

  @override
  String get spyfallLocationSchool => 'المدرسة';

  @override
  String get spyfallLocationPassengerTrain => 'قطار ركاب';

  @override
  String get spyfallLocationHauntedHouse => 'منزل مهجور';

  @override
  String get spyfallLocationFilmStudio => 'استوديو تصوير';

  @override
  String get spyfallLocationArcticStation => 'محطة قطبية';

  @override
  String get spyfallLocationMuseum => 'المتحف';

  @override
  String get spyfallLocationStadium => 'الملعب';

  @override
  String get spyfallLocationRestaurant => 'المطعم';

  @override
  String get spyfallLocationCasino => 'الكازينو';

  @override
  String get spyfallLocationAirport => 'المطار';

  @override
  String get spyfallIntelCritical => 'حرج';

  @override
  String get spyfallIntelHigh => 'عالي';

  @override
  String get spyfallIntelMid => 'متوسط';

  @override
  String get spyfallIntelLow => 'منخفض';

  @override
  String get spyfallIntelConfirmed => 'مؤكد';
}

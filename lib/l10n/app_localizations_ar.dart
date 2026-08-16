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
  String get activeDossiers => 'الألعاب المتاحة';

  @override
  String get systemStatus => 'النظام يعمل. اختر لعبتك وابدأ التحدي.';

  @override
  String get initiatePlay => 'يلا نبدأ';

  @override
  String get reveal => 'اكشف هويتك';

  @override
  String get terminate => 'إنهاء اللعبة';

  @override
  String get homeLoadError => 'حصلت مشكلة في تحميل البيانات.';

  @override
  String get retry => 'حاول تاني';

  @override
  String get noGamesAvailable => 'مفيش ألعاب متاحة حاليًا.';

  @override
  String get gameCategory => 'خداع وذكاء';

  @override
  String get activeTag => 'متاحة';

  @override
  String get operatives => 'اللاعبين';

  @override
  String get durationLabel => 'المدة';

  @override
  String get gamesTab => 'الألعاب';

  @override
  String get ranksTab => 'الترتيب';

  @override
  String get assetsTab => 'المحتوى';

  @override
  String get spyfallTitle => 'الجاسوس';

  @override
  String get spyfallDescription =>
      'اعرف مين الجاسوس قبل ما الوقت يخلص... وخلي بالك، مش كل اللي حواليك تقدر تثق فيه.';

  @override
  String get spyfallPlayers => '٣-٨ لاعبين';

  @override
  String get spyfallDuration => '١٥ دقيقة';

  @override
  String get charadesTitle => 'تمثيل صامت';

  @override
  String get charadesDescription =>
      'مثّل وخلي أصحابك يخمنوا. مواقف ومشاهد حماسية، والكلام ممنوع!';

  @override
  String get charadesPlayers => '٤ لاعبين أو أكثر';

  @override
  String get charadesDuration => '١٠ دقائق';

  @override
  String get gameUnderConstruction =>
      'اللعبة دي لسه تحت التجهيز، وهتكون متاحة قريب.';

  @override
  String get spyfallMissionParam => 'إعدادات الجولة';

  @override
  String get spyfallOperativesTitle => 'عدد اللاعبين';

  @override
  String get spyfallLoadError => 'حصلت مشكلة في تحميل بيانات اللعبة.';

  @override
  String get spyfallSelectOperatives => 'اختار عدد اللاعبين (٣-٨)';

  @override
  String get spyfallMissionDurationTitle => 'مدة الجولة';

  @override
  String get spyfallSelectDuration => 'اختار مدة الجولة';

  @override
  String get spyfallInitiateMission => 'ابدأ الجولة';

  @override
  String spyfallDurationMinutes(int count) {
    return '$count دقيقة';
  }

  @override
  String get spyfallPassDevice => 'مرّر الموبايل';

  @override
  String spyfallPassToPlayer(int index) {
    return 'مرّر الموبايل للاعب رقم $index';
  }

  @override
  String spyfallIAmPlayer(int index) {
    return 'أنا اللاعب رقم $index';
  }

  @override
  String get spyfallHiddenBriefing => 'هويتك سرية';

  @override
  String get spyfallRoleSpy => 'أنت الجاسوس';

  @override
  String get spyfallRoleAgent => 'أنت لاعب عادي';

  @override
  String get spyfallRoleNoLocation => 'الموقع مش معروف';

  @override
  String get spyfallNextPlayer => 'اللاعب التالي';

  @override
  String get spyfallStartInterrogation => 'ابدأ الاستجواب';

  @override
  String get spyfallTimeRemaining => 'الوقت المتبقي';

  @override
  String get spyfallPossibleLocations => 'المواقع المحتملة';

  @override
  String get spyfallIntelLevelLabel => 'مستوى المعلومات';

  @override
  String get spyfallLocationEmbassy => 'السفارة';

  @override
  String get spyfallLocationSubmarine => 'الغواصة';

  @override
  String get spyfallLocationResearchLab => 'معمل الأبحاث';

  @override
  String get spyfallLocationNightclub => 'الملهى الليلي';

  @override
  String get spyfallLocationSecretBase => 'القاعدة السرية';

  @override
  String get spyfallLocationBank => 'البنك';

  @override
  String get spyfallLocationHospital => 'المستشفى';

  @override
  String get spyfallLocationSpaceStation => 'محطة الفضاء';

  @override
  String get spyfallLocationPirateShip => 'سفينة القراصنة';

  @override
  String get spyfallLocationCircus => 'السيرك';

  @override
  String get spyfallLocationPoliceStation => 'قسم الشرطة';

  @override
  String get spyfallLocationSchool => 'المدرسة';

  @override
  String get spyfallLocationPassengerTrain => 'قطار الركاب';

  @override
  String get spyfallLocationHauntedHouse => 'البيت المسكون';

  @override
  String get spyfallLocationFilmStudio => 'استوديو التصوير';

  @override
  String get spyfallLocationArcticStation => 'المحطة القطبية';

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
  String get spyfallIntelCritical => 'خطير جدًا';

  @override
  String get spyfallIntelHigh => 'مرتفع';

  @override
  String get spyfallIntelMid => 'متوسط';

  @override
  String get spyfallIntelLow => 'منخفض';

  @override
  String get spyfallIntelConfirmed => 'مؤكد';
}

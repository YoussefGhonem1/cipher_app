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
  String get retry => 'إعادة المحاولة';

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

  @override
  String get select_intel_category => 'اختار ملف المهمة';

  @override
  String get awaiting_tactical_protocol => 'في انتظار تحديد البروتوكول...';

  @override
  String get action_movies => 'أفلام أكشن وإثارة';

  @override
  String get action_movies_desc => 'حلل مواقف سينمائية مليانة أكشن ومطاردات.';

  @override
  String get survival_gear => 'معدات نجاة';

  @override
  String get survival_gear_desc => 'راجع أدوات النجاة والمعدات التكتيكية.';

  @override
  String get public_figures => 'شخصيات عامة';

  @override
  String get public_figures_desc => 'حدد الأهداف والشخصيات المهمة في الساحة.';

  @override
  String get global_hotspots => 'مناطق ساخنة';

  @override
  String get global_hotspots_desc => 'تحليل جيوسياسي للمناطق النشطة حالياً.';

  @override
  String get intel_high => 'مستوى المعلومات: عالي';

  @override
  String get intel_moderate => 'مستوى المعلومات: متوسط';

  @override
  String get intel_classified => 'مستوى المعلومات: سري جداً';

  @override
  String get start_mission => 'ابدأ المهمة';

  @override
  String get place_device => 'حط الموبايل';

  @override
  String get on_forehead => 'على راسك';

  @override
  String get tilt_down_correct => 'نزل الموبايل لتحت = صح';

  @override
  String get tilt_up_pass => 'ارفع الموبايل لفوق = باس';

  @override
  String get time => 'الوقت';

  @override
  String get score => 'النتيجة';

  @override
  String get system_log => 'سجل النظام';

  @override
  String get terminated => 'انتهت';

  @override
  String get decrypted => 'ملفات اتفكت';

  @override
  String get how_to_play => 'طريقة اللعب';

  @override
  String get charades_rules =>
      '١- اختار ملف المهمة (القسم).\n٢- حط الموبايل على راسك بحيث الشاشة تكون باصة لأصحابك.\n٣- أصحابك هيمثلوا الكلمة اللي على الشاشة من غير ما يتكلموا.\n٤- لو خمنت الكلمة صح، نزل الموبايل لتحت.\n٥- لو معرفتش وعايز تفوت الكلمة، ارفع الموبايل لفوق.\n٦- جمع أكبر عدد من النقط قبل ما الوقت يخلص!';

  @override
  String get got_it => 'علم ويُنفذ';

  @override
  String get spyfallRules =>
      '١- يتم اختيار موقع سري يعلمه الجميع ما عدا \'الجاسوس\'.\n٢- يبدأ اللاعبون بتوجيه أسئلة لبعضهم البعض حول المكان.\n٣- يجب أن تكون الأسئلة ذكية وغير مباشرة لتجنب كشف المكان للجاسوس.\n٤- يحاول الجاسوس معرفة المكان دون أن يتم كشفه، بينما يحاول اللاعبون كشفه.\n٥- تنتهي الجولة بالتصويت أو عندما يخمن الجاسوس المكان الصحيح!';

  @override
  String get vaultTitle => 'الخزنة';

  @override
  String get inactiveTag => 'تحميل مطلوب';

  @override
  String get vaultDescription =>
      'حل الشفرة أو انفجر. تحدي فك التشفير الجماعي السريع.';

  @override
  String get vaultPlayers => '١-١٠ لاعبين';

  @override
  String get vaultDuration => '٥ دقائق';

  @override
  String get downloadRequired => 'تحميل مطلوب';

  @override
  String get downloadGame => 'تحميل اللعبة';

  @override
  String get vaultSetupStatus => 'حالة النظام: فعال';

  @override
  String get vaultSetupMission => 'المهمة: الخزنة-٠٩';

  @override
  String get vaultSetupSubtitle => 'حل الشفرة أو انفجر';

  @override
  String get vaultSetupPlayerCount => 'عدد اللاعبين';

  @override
  String get vaultSetupStartMission => 'بدأ المهمة';

  @override
  String get vaultRules =>
      '١. حدد عدد اللاعبين.\n٢. النظام هيعرض شفرة سرية.\n٣. مرر الجهاز للاعب المطلوب.\n٤. حل الشفرة باستخدام اللوحة قبل انتهاء الوقت.\n٥. الفشل في الحل يعني الاستبعاد فوراً.';

  @override
  String get vaultThreatLevel => 'مستوى التهديد: حرج';

  @override
  String get vaultDecryptionClue => 'مفتاح فك التشفير';

  @override
  String get vaultHintPrefix => 'تلميح: ';

  @override
  String get vaultPassDeviceTitle => 'مرر الجهاز للاعب التالي';

  @override
  String get vaultHandOffStatus => 'جاري نقل هوية العميل...';

  @override
  String get vaultIdentityConfirmed => 'تأكيد الهوية';

  @override
  String get vaultMissionFailed => 'فشلت المهمة';

  @override
  String get vaultPlayerEliminated => 'تم استبعاد اللاعب';

  @override
  String get vaultCipherUnsolved => 'فشل فك التشفير. إخفاق تكتيكي.';

  @override
  String get vaultSystemLockdown => '> تم بدء إغلاق النظام...';

  @override
  String get vaultPlayAgain => 'العب مجدداً';

  @override
  String get vaultClr => 'مسح';

  @override
  String get vaultEnt => 'إدخال';

  @override
  String get vaultConnectionSecure =>
      'الاتصال: آمن ..... التشفير: نشط\nفي انتظار الإدخال';

  @override
  String get vaultMissionSuccess => 'تم إنجاز المهمة';

  @override
  String get vaultCipherSolved => 'تم فك التشفير بنجاح.';

  @override
  String get vaultSystemUnlocked => '> تم فتح النظام...';

  @override
  String get vaultContinueGame => 'استمر في اللعبة';

  @override
  String vaultPlayerWon(int index) {
    return 'العميل رقم $index هو الفائز';
  }

  @override
  String get vaultAllEliminated => 'تم استبعاد كافة العملاء';

  @override
  String get vaultNoSurvivors => 'لا يوجد فائز. بقيت الخزنة مغلقة.';
}

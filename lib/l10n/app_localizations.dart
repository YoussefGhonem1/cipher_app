import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Cipher - Sifr'**
  String get appName;

  /// No description provided for @activeDossiers.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE DOSSIERS'**
  String get activeDossiers;

  /// No description provided for @systemStatus.
  ///
  /// In en, this message translates to:
  /// **'SYSTEM STATUS: ONLINE. AWAITING OPERATIVE SELECTION.'**
  String get systemStatus;

  /// No description provided for @initiatePlay.
  ///
  /// In en, this message translates to:
  /// **'INITIATE PLAY'**
  String get initiatePlay;

  /// No description provided for @reveal.
  ///
  /// In en, this message translates to:
  /// **'REVEAL'**
  String get reveal;

  /// No description provided for @terminate.
  ///
  /// In en, this message translates to:
  /// **'TERMINATE'**
  String get terminate;

  /// No description provided for @homeLoadError.
  ///
  /// In en, this message translates to:
  /// **'Unable to load games right now.'**
  String get homeLoadError;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @noGamesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No games available yet.'**
  String get noGamesAvailable;

  /// No description provided for @gameCategory.
  ///
  /// In en, this message translates to:
  /// **'DECEPTION'**
  String get gameCategory;

  /// No description provided for @activeTag.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE'**
  String get activeTag;

  /// No description provided for @operatives.
  ///
  /// In en, this message translates to:
  /// **'OPERATIVES'**
  String get operatives;

  /// No description provided for @durationLabel.
  ///
  /// In en, this message translates to:
  /// **'DURATION'**
  String get durationLabel;

  /// No description provided for @gamesTab.
  ///
  /// In en, this message translates to:
  /// **'GAMES'**
  String get gamesTab;

  /// No description provided for @ranksTab.
  ///
  /// In en, this message translates to:
  /// **'RANKS'**
  String get ranksTab;

  /// No description provided for @assetsTab.
  ///
  /// In en, this message translates to:
  /// **'ASSETS'**
  String get assetsTab;

  /// No description provided for @spyfallTitle.
  ///
  /// In en, this message translates to:
  /// **'SPYFALL'**
  String get spyfallTitle;

  /// No description provided for @spyfallDescription.
  ///
  /// In en, this message translates to:
  /// **'Identify the infiltrator before time runs out. Trust is a liability.'**
  String get spyfallDescription;

  /// No description provided for @spyfallPlayers.
  ///
  /// In en, this message translates to:
  /// **'3-8 PLAYERS'**
  String get spyfallPlayers;

  /// No description provided for @spyfallDuration.
  ///
  /// In en, this message translates to:
  /// **'15 MINS'**
  String get spyfallDuration;

  /// No description provided for @charadesTitle.
  ///
  /// In en, this message translates to:
  /// **'ACTION PROTOCOL'**
  String get charadesTitle;

  /// No description provided for @charadesDescription.
  ///
  /// In en, this message translates to:
  /// **'Analyze high-impact cinematic scenarios for tactical advantage.'**
  String get charadesDescription;

  /// No description provided for @charadesPlayers.
  ///
  /// In en, this message translates to:
  /// **'4+ PLAYERS'**
  String get charadesPlayers;

  /// No description provided for @charadesDuration.
  ///
  /// In en, this message translates to:
  /// **'10 MINS'**
  String get charadesDuration;

  /// No description provided for @gameUnderConstruction.
  ///
  /// In en, this message translates to:
  /// **'This game is under construction and will be playable soon.'**
  String get gameUnderConstruction;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

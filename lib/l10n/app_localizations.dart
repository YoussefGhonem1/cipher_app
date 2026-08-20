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
  /// **'Unable to load data right now.'**
  String get homeLoadError;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'RETRY'**
  String get retry;

  /// No description provided for @noGamesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No dossiers currently available.'**
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
  /// **'THE SPY'**
  String get spyfallTitle;

  /// No description provided for @spyfallDescription.
  ///
  /// In en, this message translates to:
  /// **'Identify the infiltrator before time runs out. Trust no one.'**
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
  /// **'DECRYPTION GAME'**
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
  /// **'This dossier is currently classified. Available soon.'**
  String get gameUnderConstruction;

  /// No description provided for @spyfallMissionParam.
  ///
  /// In en, this message translates to:
  /// **'MISSION_PARAM'**
  String get spyfallMissionParam;

  /// No description provided for @spyfallOperativesTitle.
  ///
  /// In en, this message translates to:
  /// **'OPERATIVES'**
  String get spyfallOperativesTitle;

  /// No description provided for @spyfallLoadError.
  ///
  /// In en, this message translates to:
  /// **'Unable to load data right now.'**
  String get spyfallLoadError;

  /// No description provided for @spyfallSelectOperatives.
  ///
  /// In en, this message translates to:
  /// **'SELECT NUMBER OF FIELD AGENTS (3-8)'**
  String get spyfallSelectOperatives;

  /// No description provided for @spyfallMissionDurationTitle.
  ///
  /// In en, this message translates to:
  /// **'MISSION_DURATION'**
  String get spyfallMissionDurationTitle;

  /// No description provided for @spyfallSelectDuration.
  ///
  /// In en, this message translates to:
  /// **'SELECT EXTRACTION WINDOW'**
  String get spyfallSelectDuration;

  /// No description provided for @spyfallInitiateMission.
  ///
  /// In en, this message translates to:
  /// **'INITIATE'**
  String get spyfallInitiateMission;

  /// No description provided for @spyfallDurationMinutes.
  ///
  /// In en, this message translates to:
  /// **'{count} MINS'**
  String spyfallDurationMinutes(int count);

  /// No description provided for @spyfallPassDevice.
  ///
  /// In en, this message translates to:
  /// **'PASS THE DEVICE'**
  String get spyfallPassDevice;

  /// No description provided for @spyfallPassToPlayer.
  ///
  /// In en, this message translates to:
  /// **'PASS TO PLAYER {index}'**
  String spyfallPassToPlayer(int index);

  /// No description provided for @spyfallIAmPlayer.
  ///
  /// In en, this message translates to:
  /// **'I AM PLAYER {index}'**
  String spyfallIAmPlayer(int index);

  /// No description provided for @spyfallHiddenBriefing.
  ///
  /// In en, this message translates to:
  /// **'IDENTITY ENCRYPTED'**
  String get spyfallHiddenBriefing;

  /// No description provided for @spyfallRoleSpy.
  ///
  /// In en, this message translates to:
  /// **'YOU ARE THE SPY'**
  String get spyfallRoleSpy;

  /// No description provided for @spyfallRoleAgent.
  ///
  /// In en, this message translates to:
  /// **'YOU ARE AN AGENT'**
  String get spyfallRoleAgent;

  /// No description provided for @spyfallRoleNoLocation.
  ///
  /// In en, this message translates to:
  /// **'LOCATION UNKNOWN'**
  String get spyfallRoleNoLocation;

  /// No description provided for @spyfallNextPlayer.
  ///
  /// In en, this message translates to:
  /// **'NEXT PLAYER'**
  String get spyfallNextPlayer;

  /// No description provided for @spyfallStartInterrogation.
  ///
  /// In en, this message translates to:
  /// **'START INTERROGATION'**
  String get spyfallStartInterrogation;

  /// No description provided for @spyfallTimeRemaining.
  ///
  /// In en, this message translates to:
  /// **'TIME REMAINING'**
  String get spyfallTimeRemaining;

  /// No description provided for @spyfallPossibleLocations.
  ///
  /// In en, this message translates to:
  /// **'POSSIBLE LOCATIONS'**
  String get spyfallPossibleLocations;

  /// No description provided for @spyfallIntelLevelLabel.
  ///
  /// In en, this message translates to:
  /// **'INTEL_LEVEL'**
  String get spyfallIntelLevelLabel;

  /// No description provided for @spyfallLocationEmbassy.
  ///
  /// In en, this message translates to:
  /// **'EMBASSY'**
  String get spyfallLocationEmbassy;

  /// No description provided for @spyfallLocationSubmarine.
  ///
  /// In en, this message translates to:
  /// **'SUBMARINE'**
  String get spyfallLocationSubmarine;

  /// No description provided for @spyfallLocationResearchLab.
  ///
  /// In en, this message translates to:
  /// **'RESEARCH LAB'**
  String get spyfallLocationResearchLab;

  /// No description provided for @spyfallLocationNightclub.
  ///
  /// In en, this message translates to:
  /// **'NIGHTCLUB'**
  String get spyfallLocationNightclub;

  /// No description provided for @spyfallLocationSecretBase.
  ///
  /// In en, this message translates to:
  /// **'SECRET BASE'**
  String get spyfallLocationSecretBase;

  /// No description provided for @spyfallLocationBank.
  ///
  /// In en, this message translates to:
  /// **'BANK'**
  String get spyfallLocationBank;

  /// No description provided for @spyfallLocationHospital.
  ///
  /// In en, this message translates to:
  /// **'HOSPITAL'**
  String get spyfallLocationHospital;

  /// No description provided for @spyfallLocationSpaceStation.
  ///
  /// In en, this message translates to:
  /// **'SPACE STATION'**
  String get spyfallLocationSpaceStation;

  /// No description provided for @spyfallLocationPirateShip.
  ///
  /// In en, this message translates to:
  /// **'PIRATE SHIP'**
  String get spyfallLocationPirateShip;

  /// No description provided for @spyfallLocationCircus.
  ///
  /// In en, this message translates to:
  /// **'CIRCUS'**
  String get spyfallLocationCircus;

  /// No description provided for @spyfallLocationPoliceStation.
  ///
  /// In en, this message translates to:
  /// **'POLICE STATION'**
  String get spyfallLocationPoliceStation;

  /// No description provided for @spyfallLocationSchool.
  ///
  /// In en, this message translates to:
  /// **'SCHOOL'**
  String get spyfallLocationSchool;

  /// No description provided for @spyfallLocationPassengerTrain.
  ///
  /// In en, this message translates to:
  /// **'PASSENGER TRAIN'**
  String get spyfallLocationPassengerTrain;

  /// No description provided for @spyfallLocationHauntedHouse.
  ///
  /// In en, this message translates to:
  /// **'HAUNTED HOUSE'**
  String get spyfallLocationHauntedHouse;

  /// No description provided for @spyfallLocationFilmStudio.
  ///
  /// In en, this message translates to:
  /// **'FILM STUDIO'**
  String get spyfallLocationFilmStudio;

  /// No description provided for @spyfallLocationArcticStation.
  ///
  /// In en, this message translates to:
  /// **'ARCTIC STATION'**
  String get spyfallLocationArcticStation;

  /// No description provided for @spyfallLocationMuseum.
  ///
  /// In en, this message translates to:
  /// **'MUSEUM'**
  String get spyfallLocationMuseum;

  /// No description provided for @spyfallLocationStadium.
  ///
  /// In en, this message translates to:
  /// **'STADIUM'**
  String get spyfallLocationStadium;

  /// No description provided for @spyfallLocationRestaurant.
  ///
  /// In en, this message translates to:
  /// **'RESTAURANT'**
  String get spyfallLocationRestaurant;

  /// No description provided for @spyfallLocationCasino.
  ///
  /// In en, this message translates to:
  /// **'CASINO'**
  String get spyfallLocationCasino;

  /// No description provided for @spyfallLocationAirport.
  ///
  /// In en, this message translates to:
  /// **'AIRPORT'**
  String get spyfallLocationAirport;

  /// No description provided for @spyfallIntelCritical.
  ///
  /// In en, this message translates to:
  /// **'CRITICAL'**
  String get spyfallIntelCritical;

  /// No description provided for @spyfallIntelHigh.
  ///
  /// In en, this message translates to:
  /// **'HIGH'**
  String get spyfallIntelHigh;

  /// No description provided for @spyfallIntelMid.
  ///
  /// In en, this message translates to:
  /// **'MODERATE'**
  String get spyfallIntelMid;

  /// No description provided for @spyfallIntelLow.
  ///
  /// In en, this message translates to:
  /// **'LOW'**
  String get spyfallIntelLow;

  /// No description provided for @spyfallIntelConfirmed.
  ///
  /// In en, this message translates to:
  /// **'CONFIRMED'**
  String get spyfallIntelConfirmed;

  /// No description provided for @select_intel_category.
  ///
  /// In en, this message translates to:
  /// **'SELECT INTEL CATEGORY'**
  String get select_intel_category;

  /// No description provided for @awaiting_tactical_protocol.
  ///
  /// In en, this message translates to:
  /// **'AWAITING TACTICAL PROTOCOL SELECTION...'**
  String get awaiting_tactical_protocol;

  /// No description provided for @action_movies.
  ///
  /// In en, this message translates to:
  /// **'ACTION MOVIES'**
  String get action_movies;

  /// No description provided for @action_movies_desc.
  ///
  /// In en, this message translates to:
  /// **'Analyze high-impact cinematic scenarios for tactical advantage.'**
  String get action_movies_desc;

  /// No description provided for @survival_gear.
  ///
  /// In en, this message translates to:
  /// **'SURVIVAL GEAR'**
  String get survival_gear;

  /// No description provided for @survival_gear_desc.
  ///
  /// In en, this message translates to:
  /// **'Review specialized equipment parameters and field deployment stats.'**
  String get survival_gear_desc;

  /// No description provided for @public_figures.
  ///
  /// In en, this message translates to:
  /// **'PUBLIC FIGURES'**
  String get public_figures;

  /// No description provided for @public_figures_desc.
  ///
  /// In en, this message translates to:
  /// **'Identify key targets, assets, and liabilities in the current theater.'**
  String get public_figures_desc;

  /// No description provided for @global_hotspots.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL HOTSPOTS'**
  String get global_hotspots;

  /// No description provided for @global_hotspots_desc.
  ///
  /// In en, this message translates to:
  /// **'Geopolitical analysis of active operational zones.'**
  String get global_hotspots_desc;

  /// No description provided for @intel_high.
  ///
  /// In en, this message translates to:
  /// **'INTEL: HIGH'**
  String get intel_high;

  /// No description provided for @intel_moderate.
  ///
  /// In en, this message translates to:
  /// **'INTEL: MODERATE'**
  String get intel_moderate;

  /// No description provided for @intel_classified.
  ///
  /// In en, this message translates to:
  /// **'INTEL: CLASSIFIED'**
  String get intel_classified;

  /// No description provided for @start_mission.
  ///
  /// In en, this message translates to:
  /// **'START MISSION'**
  String get start_mission;

  /// No description provided for @place_device.
  ///
  /// In en, this message translates to:
  /// **'PLACE DEVICE'**
  String get place_device;

  /// No description provided for @on_forehead.
  ///
  /// In en, this message translates to:
  /// **'ON FOREHEAD'**
  String get on_forehead;

  /// No description provided for @tilt_down_correct.
  ///
  /// In en, this message translates to:
  /// **'↓ TILT DOWN = CORRECT ↓'**
  String get tilt_down_correct;

  /// No description provided for @tilt_up_pass.
  ///
  /// In en, this message translates to:
  /// **'↑ TILT UP = PASS ↑'**
  String get tilt_up_pass;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'TIME'**
  String get time;

  /// No description provided for @score.
  ///
  /// In en, this message translates to:
  /// **'SCORE'**
  String get score;

  /// No description provided for @system_log.
  ///
  /// In en, this message translates to:
  /// **'SYSTEM.LOG'**
  String get system_log;

  /// No description provided for @terminated.
  ///
  /// In en, this message translates to:
  /// **'TERMINATED'**
  String get terminated;

  /// No description provided for @decrypted.
  ///
  /// In en, this message translates to:
  /// **'DECRYPTED'**
  String get decrypted;

  /// No description provided for @how_to_play.
  ///
  /// In en, this message translates to:
  /// **'HOW TO PLAY'**
  String get how_to_play;

  /// No description provided for @charades_rules.
  ///
  /// In en, this message translates to:
  /// **'1. Select your mission intel (Category).\n2. Place the device on your forehead facing your team.\n3. Your team will act out the word on the screen without speaking.\n4. If you guess correctly, tilt the device DOWN.\n5. If you want to pass, tilt the device UP.\n6. Score as many points as possible before extraction time runs out!'**
  String get charades_rules;

  /// No description provided for @got_it.
  ///
  /// In en, this message translates to:
  /// **'ACKNOWLEDGED'**
  String get got_it;

  /// No description provided for @spyfallRules.
  ///
  /// In en, this message translates to:
  /// **'1. A secret location is chosen known to everyone except the \'Spy\'.\n2. Players take turns asking each other questions about the location.\n3. Questions must be subtle to avoid revealing the location to the spy.\n4. The spy tries to deduce the location without getting caught, while agents try to expose them.\n5. The round ends upon voting or if the spy correctly guesses the location!'**
  String get spyfallRules;

  /// No description provided for @vaultTitle.
  ///
  /// In en, this message translates to:
  /// **'THE VAULT'**
  String get vaultTitle;

  /// No description provided for @inactiveTag.
  ///
  /// In en, this message translates to:
  /// **'DOWNLOAD REQUIRED'**
  String get inactiveTag;

  /// No description provided for @vaultDescription.
  ///
  /// In en, this message translates to:
  /// **'Solve the cipher or explode. Fast-paced local multiplayer decryption challenge.'**
  String get vaultDescription;

  /// No description provided for @vaultPlayers.
  ///
  /// In en, this message translates to:
  /// **'1-10 PLAYERS'**
  String get vaultPlayers;

  /// No description provided for @vaultDuration.
  ///
  /// In en, this message translates to:
  /// **'5 MINS'**
  String get vaultDuration;

  /// No description provided for @downloadRequired.
  ///
  /// In en, this message translates to:
  /// **'DOWNLOAD REQUIRED'**
  String get downloadRequired;

  /// No description provided for @downloadGame.
  ///
  /// In en, this message translates to:
  /// **'DOWNLOAD GAME'**
  String get downloadGame;

  /// No description provided for @vaultSetupStatus.
  ///
  /// In en, this message translates to:
  /// **'SYSTEM STATUS: OPERATIONAL'**
  String get vaultSetupStatus;

  /// No description provided for @vaultSetupMission.
  ///
  /// In en, this message translates to:
  /// **'MISSION: VAULT-09'**
  String get vaultSetupMission;

  /// No description provided for @vaultSetupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'SOLVE THE CIPHER OR EXPLODE'**
  String get vaultSetupSubtitle;

  /// No description provided for @vaultSetupPlayerCount.
  ///
  /// In en, this message translates to:
  /// **'PLAYER COUNT'**
  String get vaultSetupPlayerCount;

  /// No description provided for @vaultSetupStartMission.
  ///
  /// In en, this message translates to:
  /// **'START MISSION'**
  String get vaultSetupStartMission;

  /// No description provided for @vaultRules.
  ///
  /// In en, this message translates to:
  /// **'1. Set the number of operatives.\n2. The system will display a cipher.\n3. Pass the device to the assigned operative.\n4. Decrypt the code using the numpad before the timer expires.\n5. Failure results in immediate elimination.'**
  String get vaultRules;

  /// No description provided for @vaultThreatLevel.
  ///
  /// In en, this message translates to:
  /// **'THREAT LEVEL: CRITICAL'**
  String get vaultThreatLevel;

  /// No description provided for @vaultDecryptionClue.
  ///
  /// In en, this message translates to:
  /// **'DECRYPTION CLUE'**
  String get vaultDecryptionClue;

  /// No description provided for @vaultHintPrefix.
  ///
  /// In en, this message translates to:
  /// **'HINT: '**
  String get vaultHintPrefix;

  /// No description provided for @vaultPassDeviceTitle.
  ///
  /// In en, this message translates to:
  /// **'PASS DEVICE TO NEXT PLAYER'**
  String get vaultPassDeviceTitle;

  /// No description provided for @vaultHandOffStatus.
  ///
  /// In en, this message translates to:
  /// **'AGENT IDENTITY HAND-OFF IN PROGRESS...'**
  String get vaultHandOffStatus;

  /// No description provided for @vaultIdentityConfirmed.
  ///
  /// In en, this message translates to:
  /// **'IDENTITY CONFIRMED'**
  String get vaultIdentityConfirmed;

  /// No description provided for @vaultMissionFailed.
  ///
  /// In en, this message translates to:
  /// **'MISSION FAILED'**
  String get vaultMissionFailed;

  /// No description provided for @vaultPlayerEliminated.
  ///
  /// In en, this message translates to:
  /// **'PLAYER ELIMINATED'**
  String get vaultPlayerEliminated;

  /// No description provided for @vaultCipherUnsolved.
  ///
  /// In en, this message translates to:
  /// **'THE CIPHER REMAINED UNSOLVED. TACTICAL FAILURE.'**
  String get vaultCipherUnsolved;

  /// No description provided for @vaultSystemLockdown.
  ///
  /// In en, this message translates to:
  /// **'> SYSTEM LOCKDOWN INITIATED...'**
  String get vaultSystemLockdown;

  /// No description provided for @vaultPlayAgain.
  ///
  /// In en, this message translates to:
  /// **'PLAY AGAIN'**
  String get vaultPlayAgain;

  /// No description provided for @vaultClr.
  ///
  /// In en, this message translates to:
  /// **'CLR'**
  String get vaultClr;

  /// No description provided for @vaultEnt.
  ///
  /// In en, this message translates to:
  /// **'ENT'**
  String get vaultEnt;

  /// No description provided for @vaultConnectionSecure.
  ///
  /// In en, this message translates to:
  /// **'CONNECTION: SECURE ..... ENCRYPTION: ACTIVE\nAWAITING INPUT'**
  String get vaultConnectionSecure;

  /// No description provided for @vaultMissionSuccess.
  ///
  /// In en, this message translates to:
  /// **'MISSION ACCOMPLISHED'**
  String get vaultMissionSuccess;

  /// No description provided for @vaultCipherSolved.
  ///
  /// In en, this message translates to:
  /// **'CIPHER DECRYPTED SUCCESSFULLY.'**
  String get vaultCipherSolved;

  /// No description provided for @vaultSystemUnlocked.
  ///
  /// In en, this message translates to:
  /// **'> SYSTEM UNLOCKED...'**
  String get vaultSystemUnlocked;

  /// No description provided for @vaultContinueGame.
  ///
  /// In en, this message translates to:
  /// **'CONTINUE GAME'**
  String get vaultContinueGame;

  /// No description provided for @vaultPlayerWon.
  ///
  /// In en, this message translates to:
  /// **'PLAYER {index} VICTORIOUS'**
  String vaultPlayerWon(int index);

  /// No description provided for @vaultAllEliminated.
  ///
  /// In en, this message translates to:
  /// **'ALL OPERATIVES ELIMINATED'**
  String get vaultAllEliminated;

  /// No description provided for @vaultNoSurvivors.
  ///
  /// In en, this message translates to:
  /// **'NO SURVIVORS. THE VAULT REMAINS SEALED.'**
  String get vaultNoSurvivors;
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

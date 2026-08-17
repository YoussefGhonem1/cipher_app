// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Cipher - Sifr';

  @override
  String get activeDossiers => 'ACTIVE DOSSIERS';

  @override
  String get systemStatus =>
      'SYSTEM STATUS: ONLINE. AWAITING OPERATIVE SELECTION.';

  @override
  String get initiatePlay => 'INITIATE PLAY';

  @override
  String get reveal => 'REVEAL';

  @override
  String get terminate => 'TERMINATE';

  @override
  String get homeLoadError => 'Unable to load data right now.';

  @override
  String get retry => 'RETRY';

  @override
  String get noGamesAvailable => 'No dossiers currently available.';

  @override
  String get gameCategory => 'DECEPTION';

  @override
  String get activeTag => 'ACTIVE';

  @override
  String get operatives => 'OPERATIVES';

  @override
  String get durationLabel => 'DURATION';

  @override
  String get gamesTab => 'GAMES';

  @override
  String get ranksTab => 'RANKS';

  @override
  String get assetsTab => 'ASSETS';

  @override
  String get spyfallTitle => 'THE SPY';

  @override
  String get spyfallDescription =>
      'Identify the infiltrator before time runs out. Trust no one.';

  @override
  String get spyfallPlayers => '3-8 PLAYERS';

  @override
  String get spyfallDuration => '15 MINS';

  @override
  String get charadesTitle => 'DECRYPTION GAME';

  @override
  String get charadesDescription =>
      'Analyze high-impact cinematic scenarios for tactical advantage.';

  @override
  String get charadesPlayers => '4+ PLAYERS';

  @override
  String get charadesDuration => '10 MINS';

  @override
  String get gameUnderConstruction =>
      'This dossier is currently classified. Available soon.';

  @override
  String get spyfallMissionParam => 'MISSION_PARAM';

  @override
  String get spyfallOperativesTitle => 'OPERATIVES';

  @override
  String get spyfallLoadError => 'Unable to load data right now.';

  @override
  String get spyfallSelectOperatives => 'SELECT NUMBER OF FIELD AGENTS (3-8)';

  @override
  String get spyfallMissionDurationTitle => 'MISSION_DURATION';

  @override
  String get spyfallSelectDuration => 'SELECT EXTRACTION WINDOW';

  @override
  String get spyfallInitiateMission => 'INITIATE';

  @override
  String spyfallDurationMinutes(int count) {
    return '$count MINS';
  }

  @override
  String get spyfallPassDevice => 'PASS THE DEVICE';

  @override
  String spyfallPassToPlayer(int index) {
    return 'PASS TO PLAYER $index';
  }

  @override
  String spyfallIAmPlayer(int index) {
    return 'I AM PLAYER $index';
  }

  @override
  String get spyfallHiddenBriefing => 'IDENTITY ENCRYPTED';

  @override
  String get spyfallRoleSpy => 'YOU ARE THE SPY';

  @override
  String get spyfallRoleAgent => 'YOU ARE AN AGENT';

  @override
  String get spyfallRoleNoLocation => 'LOCATION UNKNOWN';

  @override
  String get spyfallNextPlayer => 'NEXT PLAYER';

  @override
  String get spyfallStartInterrogation => 'START INTERROGATION';

  @override
  String get spyfallTimeRemaining => 'TIME REMAINING';

  @override
  String get spyfallPossibleLocations => 'POSSIBLE LOCATIONS';

  @override
  String get spyfallIntelLevelLabel => 'INTEL_LEVEL';

  @override
  String get spyfallLocationEmbassy => 'EMBASSY';

  @override
  String get spyfallLocationSubmarine => 'SUBMARINE';

  @override
  String get spyfallLocationResearchLab => 'RESEARCH LAB';

  @override
  String get spyfallLocationNightclub => 'NIGHTCLUB';

  @override
  String get spyfallLocationSecretBase => 'SECRET BASE';

  @override
  String get spyfallLocationBank => 'BANK';

  @override
  String get spyfallLocationHospital => 'HOSPITAL';

  @override
  String get spyfallLocationSpaceStation => 'SPACE STATION';

  @override
  String get spyfallLocationPirateShip => 'PIRATE SHIP';

  @override
  String get spyfallLocationCircus => 'CIRCUS';

  @override
  String get spyfallLocationPoliceStation => 'POLICE STATION';

  @override
  String get spyfallLocationSchool => 'SCHOOL';

  @override
  String get spyfallLocationPassengerTrain => 'PASSENGER TRAIN';

  @override
  String get spyfallLocationHauntedHouse => 'HAUNTED HOUSE';

  @override
  String get spyfallLocationFilmStudio => 'FILM STUDIO';

  @override
  String get spyfallLocationArcticStation => 'ARCTIC STATION';

  @override
  String get spyfallLocationMuseum => 'MUSEUM';

  @override
  String get spyfallLocationStadium => 'STADIUM';

  @override
  String get spyfallLocationRestaurant => 'RESTAURANT';

  @override
  String get spyfallLocationCasino => 'CASINO';

  @override
  String get spyfallLocationAirport => 'AIRPORT';

  @override
  String get spyfallIntelCritical => 'CRITICAL';

  @override
  String get spyfallIntelHigh => 'HIGH';

  @override
  String get spyfallIntelMid => 'MODERATE';

  @override
  String get spyfallIntelLow => 'LOW';

  @override
  String get spyfallIntelConfirmed => 'CONFIRMED';

  @override
  String get select_intel_category => 'SELECT INTEL CATEGORY';

  @override
  String get awaiting_tactical_protocol =>
      'AWAITING TACTICAL PROTOCOL SELECTION...';

  @override
  String get action_movies => 'ACTION MOVIES';

  @override
  String get action_movies_desc =>
      'Analyze high-impact cinematic scenarios for tactical advantage.';

  @override
  String get survival_gear => 'SURVIVAL GEAR';

  @override
  String get survival_gear_desc =>
      'Review specialized equipment parameters and field deployment stats.';

  @override
  String get public_figures => 'PUBLIC FIGURES';

  @override
  String get public_figures_desc =>
      'Identify key targets, assets, and liabilities in the current theater.';

  @override
  String get global_hotspots => 'GLOBAL HOTSPOTS';

  @override
  String get global_hotspots_desc =>
      'Geopolitical analysis of active operational zones.';

  @override
  String get intel_high => 'INTEL: HIGH';

  @override
  String get intel_moderate => 'INTEL: MODERATE';

  @override
  String get intel_classified => 'INTEL: CLASSIFIED';

  @override
  String get start_mission => 'START MISSION';

  @override
  String get place_device => 'PLACE DEVICE';

  @override
  String get on_forehead => 'ON FOREHEAD';

  @override
  String get tilt_down_correct => '↓ TILT DOWN = CORRECT ↓';

  @override
  String get tilt_up_pass => '↑ TILT UP = PASS ↑';

  @override
  String get time => 'TIME';

  @override
  String get score => 'SCORE';

  @override
  String get system_log => 'SYSTEM.LOG';

  @override
  String get terminated => 'TERMINATED';

  @override
  String get decrypted => 'DECRYPTED';

  @override
  String get how_to_play => 'HOW TO PLAY';

  @override
  String get charades_rules =>
      '1. Select your mission intel (Category).\n2. Place the device on your forehead facing your team.\n3. Your team will act out the word on the screen without speaking.\n4. If you guess correctly, tilt the device DOWN.\n5. If you want to pass, tilt the device UP.\n6. Score as many points as possible before extraction time runs out!';

  @override
  String get got_it => 'ACKNOWLEDGED';

  @override
  String get spyfallRules =>
      '1. A secret location is chosen known to everyone except the \'Spy\'.\n2. Players take turns asking each other questions about the location.\n3. Questions must be subtle to avoid revealing the location to the spy.\n4. The spy tries to deduce the location without getting caught, while agents try to expose them.\n5. The round ends upon voting or if the spy correctly guesses the location!';
}

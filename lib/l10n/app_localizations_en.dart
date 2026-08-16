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
  String get homeLoadError => 'Unable to load games right now.';

  @override
  String get retry => 'Retry';

  @override
  String get noGamesAvailable => 'No games available yet.';

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
  String get spyfallTitle => 'SPYFALL';

  @override
  String get spyfallDescription =>
      'Identify the infiltrator before time runs out. Trust is a liability.';

  @override
  String get spyfallPlayers => '3-8 PLAYERS';

  @override
  String get spyfallDuration => '15 MINS';

  @override
  String get charadesTitle => 'ACTION PROTOCOL';

  @override
  String get charadesDescription =>
      'Analyze high-impact cinematic scenarios for tactical advantage.';

  @override
  String get charadesPlayers => '4+ PLAYERS';

  @override
  String get charadesDuration => '10 MINS';

  @override
  String get gameUnderConstruction =>
      'This game is under construction and will be playable soon.';
}

import 'package:flutter/widgets.dart';
import '../../../../core/utils/l10n_extensions.dart';

String spyfallTextByKey(BuildContext context, String key) {
  switch (key) {
    case 'spyfallLocationEmbassy': return context.l10n.spyfallLocationEmbassy;
    case 'spyfallLocationSubmarine': return context.l10n.spyfallLocationSubmarine;
    case 'spyfallLocationResearchLab': return context.l10n.spyfallLocationResearchLab;
    case 'spyfallLocationNightclub': return context.l10n.spyfallLocationNightclub;
    case 'spyfallLocationSecretBase': return context.l10n.spyfallLocationSecretBase;
    case 'spyfallLocationAirport': return context.l10n.spyfallLocationAirport;
    case 'spyfallLocationBank': return context.l10n.spyfallLocationBank;
    case 'spyfallLocationHospital': return context.l10n.spyfallLocationHospital;
    case 'spyfallLocationSpaceStation': return context.l10n.spyfallLocationSpaceStation;
    case 'spyfallLocationPirateShip': return context.l10n.spyfallLocationPirateShip;
    case 'spyfallLocationCircus': return context.l10n.spyfallLocationCircus;
    case 'spyfallLocationPoliceStation': return context.l10n.spyfallLocationPoliceStation;
    case 'spyfallLocationSchool': return context.l10n.spyfallLocationSchool;
    case 'spyfallLocationPassengerTrain': return context.l10n.spyfallLocationPassengerTrain;
    case 'spyfallLocationHauntedHouse': return context.l10n.spyfallLocationHauntedHouse;
    case 'spyfallLocationFilmStudio': return context.l10n.spyfallLocationFilmStudio;
    case 'spyfallLocationArcticStation': return context.l10n.spyfallLocationArcticStation;
    case 'spyfallLocationMuseum': return context.l10n.spyfallLocationMuseum;
    case 'spyfallLocationStadium': return context.l10n.spyfallLocationStadium;
    case 'spyfallLocationRestaurant': return context.l10n.spyfallLocationRestaurant;
    case 'spyfallLocationCasino': return context.l10n.spyfallLocationCasino;
    case 'spyfallIntelCritical': return context.l10n.spyfallIntelCritical;
    case 'spyfallIntelHigh': return context.l10n.spyfallIntelHigh;
    case 'spyfallIntelMid': return context.l10n.spyfallIntelMid;
    case 'spyfallIntelLow': return context.l10n.spyfallIntelLow;
    case 'spyfallIntelConfirmed': return context.l10n.spyfallIntelConfirmed;
    default: return key;
  }
}
import '../../domain/entities/game_dossier_entity.dart';

class GameDossierModel extends GameDossierEntity {
  const GameDossierModel({
    required super.id,
    required super.title,
    required super.description,
    required super.intelLevel,
    required super.playerCount,
    required super.duration,
    required super.isActive,
    required super.route,
  });

  factory GameDossierModel.fromJson(Map<String, dynamic> json) {
    return GameDossierModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      intelLevel: json['intelLevel'] as String,
      playerCount: json['playerCount'] as String,
      duration: json['duration'] as String,
      isActive: json['isActive'] as bool,
      route: json['route'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'intelLevel': intelLevel,
      'playerCount': playerCount,
      'duration': duration,
      'isActive': isActive,
      'route': route,
    };
  }
}
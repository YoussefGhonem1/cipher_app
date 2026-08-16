class GameDossierEntity {
  final String id;
  final String title;
  final String description;
  final String intelLevel;
  final String playerCount;
  final String duration;
  final bool isActive;
  final String route;

  const GameDossierEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.intelLevel,
    required this.playerCount,
    required this.duration,
    required this.isActive,
    required this.route,
  });
}
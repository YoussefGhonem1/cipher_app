abstract class GameSyncState {}

class GameSyncInitial extends GameSyncState {}

class GameSyncLoading extends GameSyncState {}

class GameSyncSuccess extends GameSyncState {
  final bool isUpdated;
  
  GameSyncSuccess({required this.isUpdated});
}

class GameSyncError extends GameSyncState {
  final String message;
  
  GameSyncError(this.message);
}
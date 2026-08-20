import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import '../../../core/services/hive_service.dart';
import 'game_sync_state.dart';

class GameSyncCubit extends Cubit<GameSyncState> {
  GameSyncCubit() : super(GameSyncInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Safe getter to retrieve the Hive box, opening it if necessary
  Future<Box> get _gamesBox async {
    if (Hive.isBoxOpen(HiveService.gameBoxName)) {
      return Hive.box(HiveService.gameBoxName);
    }
    return await Hive.openBox(HiveService.gameBoxName);
  }

  Future<void> fetchAndSyncGame(String gameId) async {
    emit(GameSyncLoading());

    try {
      final box = await _gamesBox;

      // 1. Retrieve local game data from Hive to check the current version
      final localGameData = box.get(gameId);
      final int localVersion = localGameData != null
          ? (localGameData['version'] ?? 0)
          : 0;

      // 2. Fetch the latest game data from Firestore
      final DocumentSnapshot snapshot = await _firestore
          .collection('games')
          .doc(gameId)
          .get();

      if (snapshot.exists) {
        final serverGameData = snapshot.data() as Map<String, dynamic>;
        final int serverVersion = serverGameData['version'] ?? 1;

        // 3. Compare versions to decide if a silent update is needed
        if (serverVersion > localVersion) {
          await box.put(gameId, serverGameData);
          emit(GameSyncSuccess(isUpdated: true));
        } else {
          emit(GameSyncSuccess(isUpdated: false));
        }
      } else {
        emit(GameSyncError("Error: Game not found on the server"));
      }
    } catch (e) {
      final box = await _gamesBox;
      // 4. Fallback to local data if network fails
      if (box.containsKey(gameId)) {
        emit(GameSyncSuccess(isUpdated: false));
      } else {
        emit(GameSyncError("Error: Failed to fetch game data: $e"));
      }
    }
  }
}

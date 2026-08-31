import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import '../../../core/services/hive_service.dart';
import 'game_sync_state.dart';

class GameSyncCubit extends Cubit<GameSyncState> {
  GameSyncCubit() : super(GameSyncInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Box> get _gamesBox async {
    if (Hive.isBoxOpen(HiveService.gameBoxName)) {
      return Hive.box(HiveService.gameBoxName);
    }
    return await Hive.openBox(HiveService.gameBoxName);
  }

  Future<void> fetchAndSyncGame(String gameId) async {
    if (gameId == 'spyfall' || gameId == 'charades') {
      emit(GameSyncSuccess(isUpdated: false));
      return;
    }

    emit(GameSyncLoading());

    try {
      final box = await _gamesBox;

      final localGameData = box.get(gameId);
      final int localVersion = localGameData != null
          ? (localGameData['version'] ?? 0)
          : 0;

      final DocumentSnapshot snapshot = await _firestore
          .collection('games')
          .doc(gameId)
          .get();

      if (snapshot.exists) {
        final serverGameData = snapshot.data() as Map<String, dynamic>;
        final int serverVersion = serverGameData['version'] ?? 1;

        if (serverVersion > localVersion) {
          await box.put(gameId, serverGameData);
          emit(GameSyncSuccess(isUpdated: true));
        } else {
          emit(GameSyncSuccess(isUpdated: false));
        }
      } else {
        if (box.containsKey(gameId)) {
          emit(GameSyncSuccess(isUpdated: false));
        } else {
          emit(GameSyncError("Error: Game not found on the server"));
        }
      }
    } catch (e) {
      final box = await _gamesBox;
      if (box.containsKey(gameId)) {
        emit(GameSyncSuccess(isUpdated: false));
      } else {
        emit(GameSyncError("Error: Failed to fetch game data: $e"));
      }
    }
  }
}
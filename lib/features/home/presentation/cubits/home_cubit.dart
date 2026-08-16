import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/entities/game_dossier_entity.dart';

class HomeState {
  static const _unset = Object();

  final List<GameDossierEntity> dossiers;
  final int selectedIndex;
  final bool isLoading;
  final String? errorMessage;

  const HomeState({
    required this.dossiers,
    this.selectedIndex = 0,
    this.isLoading = false,
    this.errorMessage,
  });

  HomeState copyWith({
    List<GameDossierEntity>? dossiers,
    int? selectedIndex,
    bool? isLoading,
    Object? errorMessage = _unset,
  }) {
    return HomeState(
      dossiers: dossiers ?? this.dossiers,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: identical(errorMessage, _unset)
          ? this.errorMessage
          : errorMessage as String?,
    );
  }
}

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;

  HomeCubit({required this.homeRepository})
    : super(const HomeState(dossiers: []));

  Future<void> loadGames() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final games = await homeRepository.getGames();
      emit(
        state.copyWith(
          dossiers: games,
          isLoading: false,
          selectedIndex: games.isEmpty
              ? 0
              : state.selectedIndex.clamp(0, games.length - 1),
          errorMessage: null,
        ),
      );
    } catch (_) {
      emit(state.copyWith(isLoading: false, errorMessage: 'load_games_failed'));
    }
  }

  void selectGame(int index) {
    if (index < 0 || index >= state.dossiers.length) {
      return;
    }
    emit(state.copyWith(selectedIndex: index));
  }
}

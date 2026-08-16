import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/entities/game_dossier_entity.dart';

class HomeState {
  final List<GameDossierEntity> dossiers;
  final int selectedIndex;
  final bool isLoading;

  const HomeState({
    required this.dossiers,
    this.selectedIndex = 0,
    this.isLoading = false,
  });

  HomeState copyWith({
    List<GameDossierEntity>? dossiers,
    int? selectedIndex,
    bool? isLoading,
  }) {
    return HomeState(
      dossiers: dossiers ?? this.dossiers,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;

  HomeCubit({required this.homeRepository}) : super(const HomeState(dossiers: [])) {
    loadGames();
  }

  Future<void> loadGames() async {
    emit(state.copyWith(isLoading: true));
    try {
      final games = await homeRepository.getGames();
      emit(state.copyWith(dossiers: games, isLoading: false));
    } catch (_) {
      emit(state.copyWith(isLoading: false));
    }
  }

  void selectGame(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
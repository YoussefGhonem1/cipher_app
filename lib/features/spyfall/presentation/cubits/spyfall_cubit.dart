import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/spyfall_location_entity.dart';
import '../../domain/repositories/spyfall_repository.dart';

enum SpyfallPhase { setup, handoff, briefing, interrogation }

class SpyfallState {
  static const _unset = Object();

  final SpyfallPhase phase;
  final bool isLoading;
  final String? errorMessage;
  final List<SpyfallLocationEntity> locations;
  final int playerCount;
  final int durationMinutes;
  final int currentPlayer;
  final int spyPlayer;
  final String selectedLocationId;
  final bool isRoleRevealed;
  final int secondsRemaining;
  final List<String> playedLocationIds;

  const SpyfallState({
    required this.phase,
    required this.isLoading,
    required this.errorMessage,
    required this.locations,
    required this.playerCount,
    required this.durationMinutes,
    required this.currentPlayer,
    required this.spyPlayer,
    required this.selectedLocationId,
    required this.isRoleRevealed,
    required this.secondsRemaining,
    required this.playedLocationIds,
  });

  const SpyfallState.initial()
      : phase = SpyfallPhase.setup,
        isLoading = false,
        errorMessage = null,
        locations = const [],
        playerCount = 4,
        durationMinutes = 10,
        currentPlayer = 1,
        spyPlayer = 1,
        selectedLocationId = '',
        isRoleRevealed = false,
        secondsRemaining = 10 * 60,
        playedLocationIds = const [];

  bool get isCurrentPlayerSpy => currentPlayer == spyPlayer;

  SpyfallLocationEntity? get selectedLocation {
    if (selectedLocationId.isEmpty) {
      return null;
    }

    for (final location in locations) {
      if (location.id == selectedLocationId) {
        return location;
      }
    }
    return null;
  }

  SpyfallState copyWith({
    SpyfallPhase? phase,
    bool? isLoading,
    Object? errorMessage = _unset,
    List<SpyfallLocationEntity>? locations,
    int? playerCount,
    int? durationMinutes,
    int? currentPlayer,
    int? spyPlayer,
    String? selectedLocationId,
    bool? isRoleRevealed,
    int? secondsRemaining,
    List<String>? playedLocationIds,
  }) {
    return SpyfallState(
      phase: phase ?? this.phase,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: identical(errorMessage, _unset)
          ? this.errorMessage
          : errorMessage as String?,
      locations: locations ?? this.locations,
      playerCount: playerCount ?? this.playerCount,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      spyPlayer: spyPlayer ?? this.spyPlayer,
      selectedLocationId: selectedLocationId ?? this.selectedLocationId,
      isRoleRevealed: isRoleRevealed ?? this.isRoleRevealed,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      playedLocationIds: playedLocationIds ?? this.playedLocationIds,
    );
  }
}

@injectable
class SpyfallCubit extends Cubit<SpyfallState> {
  final SpyfallRepository repository;
  final Random _random;

  Timer? _timer;

  SpyfallCubit({required this.repository, Random? random})
      : _random = random ?? Random(),
        super(const SpyfallState.initial());

  Future<void> initialize() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final locations = await repository.getLocations();
      emit(state.copyWith(isLoading: false, locations: locations));
    } catch (_) {
      emit(
        state.copyWith(isLoading: false, errorMessage: 'spyfall_load_failed'),
      );
    }
  }

  void increasePlayers() {
    final next = state.playerCount + 1;
    emit(state.copyWith(playerCount: next.clamp(3, 8)));
  }

  void decreasePlayers() {
    final next = state.playerCount - 1;
    emit(state.copyWith(playerCount: next.clamp(3, 8)));
  }

  void selectDuration(int minutes) {
    if (minutes != 5 && minutes != 10 && minutes != 15) {
      return;
    }
    emit(state.copyWith(durationMinutes: minutes));
  }

  void initiateMission() {
    if (state.locations.isEmpty) {
      return;
    }

    _timer?.cancel();

    final spyPlayer = _random.nextInt(state.playerCount) + 1;

    List<SpyfallLocationEntity> availableLocations = state.locations
        .where((loc) => !state.playedLocationIds.contains(loc.id))
        .toList();

    List<String> nextPlayedIds = List.of(state.playedLocationIds);

    if (availableLocations.isEmpty) {
      availableLocations = List.of(state.locations);
      nextPlayedIds.clear();
    }

    final selectedLocation =
        availableLocations[_random.nextInt(availableLocations.length)];
    
    nextPlayedIds.add(selectedLocation.id);

    emit(
      state.copyWith(
        phase: SpyfallPhase.handoff,
        currentPlayer: 1,
        spyPlayer: spyPlayer,
        selectedLocationId: selectedLocation.id,
        isRoleRevealed: false,
        secondsRemaining: state.durationMinutes * 60,
        errorMessage: null,
        playedLocationIds: nextPlayedIds,
      ),
    );
  }

  void continueFromHandoff() {
    emit(state.copyWith(phase: SpyfallPhase.briefing, isRoleRevealed: false));
  }

  void revealRole() {
    if (state.phase != SpyfallPhase.briefing) {
      return;
    }
    emit(state.copyWith(isRoleRevealed: true));
  }

  void nextPlayerOrStart() {
    if (state.phase != SpyfallPhase.briefing || !state.isRoleRevealed) {
      return;
    }

    if (state.currentPlayer < state.playerCount) {
      emit(
        state.copyWith(
          currentPlayer: state.currentPlayer + 1,
          phase: SpyfallPhase.handoff,
          isRoleRevealed: false,
        ),
      );
      return;
    }

    _startInterrogation();
  }

  void terminateMission() {
    _timer?.cancel();
    _timer = null;

    emit(
      state.copyWith(
        phase: SpyfallPhase.setup,
        currentPlayer: 1,
        spyPlayer: 1,
        isRoleRevealed: false,
        secondsRemaining: state.durationMinutes * 60,
      ),
    );
  }

  void _startInterrogation() {
    _timer?.cancel();

    emit(
      state.copyWith(
        phase: SpyfallPhase.interrogation,
        isRoleRevealed: false,
        secondsRemaining: state.durationMinutes * 60,
      ),
    );

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.secondsRemaining <= 1) {
        _timer?.cancel();
        emit(state.copyWith(secondsRemaining: 0));
        return;
      }
      emit(state.copyWith(secondsRemaining: state.secondsRemaining - 1));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
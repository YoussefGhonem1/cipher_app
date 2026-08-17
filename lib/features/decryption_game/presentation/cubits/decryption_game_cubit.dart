import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/word_result_entity.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import 'decryption_game_state.dart';

class DecryptionGameCubit extends Cubit<DecryptionGameState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  List<CategoryEntity> _categories = [];
  CategoryEntity? _selectedCategory;
  List<String> _currentWordsPool = [];
  final List<WordResultEntity> _results = [];
  int _score = 0;
  int _gameDuration = 120;

  Timer? _gameTimer;
  Timer? _prepTimer;
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;

  bool _canAnswer = true;
  bool _isNeutral = true;

  DecryptionGameCubit({required this.getCategoriesUseCase})
    : super(DecryptionGameInitial());

  Future<void> fetchCategories(String langCode) async {
    emit(CategoriesLoading());
    final failureOrCategories = await getCategoriesUseCase(langCode);
    failureOrCategories.fold(
      (failure) => emit(const CategoriesError('Failed to load categories')),
      (categories) {
        _categories = categories;
        emit(CategoriesLoaded(_categories, _selectedCategory));
      },
    );
  }

  void selectCategory(CategoryEntity category) {
    _selectedCategory = category;
    emit(CategoriesLoaded(_categories, _selectedCategory));
  }

  void startPreparation() {
    if (_selectedCategory == null) return;

    _currentWordsPool = List.from(_selectedCategory!.wordsPool)..shuffle();
    _results.clear();
    _score = 0;
    _gameDuration = 120;

    int countdown = 3;
    emit(GamePreparation(_selectedCategory!, countdown));

    _prepTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      countdown--;
      if (countdown > 0) {
        emit(GamePreparation(_selectedCategory!, countdown));
      } else {
        timer.cancel();
        _startGame();
      }
    });
  }

  void _startGame() {
    if (_currentWordsPool.isEmpty) {
      _endGame();
      return;
    }

    _canAnswer = true;
    _isNeutral = true;

    emit(
      GamePlaying(
        currentWord: _currentWordsPool.removeLast(),
        timeRemaining: _gameDuration,
        score: _score,
      ),
    );

    _listenToSensors();

    _gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _gameDuration--;
      if (_gameDuration > 0) {
        if (state is GamePlaying) {
          final currentState = state as GamePlaying;
          emit(
            GamePlaying(
              currentWord: currentState.currentWord,
              timeRemaining: _gameDuration,
              score: _score,
            ),
          );
        }
      } else {
        timer.cancel();
        _endGame();
      }
    });
  }

  void _listenToSensors() {
    _accelerometerSubscription = accelerometerEventStream().listen((event) {
      if (state is! GamePlaying) return;

      if (event.z.abs() < 4.0) {
        _isNeutral = true;
      }

      if (!_canAnswer || !_isNeutral) return;

      if (event.z < -7.0) {
        _handleAnswer(isCorrect: true);
      } else if (event.z > 7.0) {
        _handleAnswer(isCorrect: false);
      }
    });
  }

  void _handleAnswer({required bool isCorrect}) {
    _canAnswer = false;
    _isNeutral = false;
    final currentState = state as GamePlaying;

    if (isCorrect) _score++;

    _results.add(
      WordResultEntity(word: currentState.currentWord, isCorrect: isCorrect),
    );

    emit(
      GamePlaying(
        currentWord: currentState.currentWord,
        timeRemaining: _gameDuration,
        score: _score,
        showCorrectIndicator: isCorrect,
        showPassIndicator: !isCorrect,
      ),
    );

    Future.delayed(const Duration(milliseconds: 800), () {
      if (_currentWordsPool.isEmpty || _gameDuration <= 0) {
        _endGame();
        return;
      }

      emit(
        GamePlaying(
          currentWord: _currentWordsPool.removeLast(),
          timeRemaining: _gameDuration,
          score: _score,
        ),
      );
      _canAnswer = true;
    });
  }

  void _endGame() {
    _gameTimer?.cancel();
    _prepTimer?.cancel();
    _accelerometerSubscription?.cancel();
    emit(GameOver(_results, _score));
  }

  void retry() {
    emit(CategoriesLoaded(_categories, _selectedCategory));
  }

  @override
  Future<void> close() {
    _gameTimer?.cancel();
    _prepTimer?.cancel();
    _accelerometerSubscription?.cancel();
    return super.close();
  }
}

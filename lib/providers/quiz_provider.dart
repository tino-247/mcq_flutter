import 'package:flutter/material.dart';
import 'package:mcq_trainer/data/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizProvider extends ChangeNotifier {
  final AppDatabase db;
  List<Question> _questions = [];
  int _currentIndex = 0;
  bool _isQuizFinished = false;
  int _score = 0;
  int weakThreshold = 3;

  QuizProvider(this.db) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    weakThreshold = prefs.getInt('weakThreshold') ?? 3;
    notifyListeners();
  }

  Future<void> saveThreshold(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('weakThreshold', value);
    weakThreshold = value;
    notifyListeners();
  }

  // --- Getters ---
  List<Question> get questions => _questions;
  int get currentIndex => _currentIndex;
  bool get isQuizFinished => _isQuizFinished;
  int get score => _score;

  // FIX: Added this getter to resolve the error
  bool get isQuizActive => _questions.isNotEmpty && !_isQuizFinished;

  Question? get currentQuestion => 
      (_questions.isNotEmpty && _currentIndex < _questions.length) 
      ? _questions[_currentIndex] 
      : null;

  // --- Logic ---

  Future<void> startQuiz({
    String? category,
    String? subCategory,
    bool onlyWeak = false,
    bool onlyUnanswered = false,
    bool onlyIncorrect = false,
  }) async {
    _questions = await db.getQuizQuestions(
      category: category,
      subCategory: subCategory,
      onlyWeak: onlyWeak,
      weakThreshold: weakThreshold,
      onlyUnanswered: onlyUnanswered,
      onlyIncorrect: onlyIncorrect,
    );
    
    _currentIndex = 0;
    _score = 0;
    // If no questions found, quiz is immediately "finished"
    _isQuizFinished = _questions.isEmpty;
    notifyListeners();
  }

  Future<void> answerQuestion(String chosenOption) async {
    if (currentQuestion == null) return;
    
    final q = currentQuestion!;
    // Normalize string comparison
    final isCorrect = q.correctAnswer.trim().toUpperCase() == chosenOption.trim().toUpperCase();
    
    if (isCorrect) _score++;
    
    await db.updateStats(q.id, chosenOption, isCorrect);

    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
    } else {
      _isQuizFinished = true;
    }
    notifyListeners();
  }
  
  Future<void> clearDatabase() async {
    await db.clearAllData();
    // Reset local state too
    _questions = [];
    _isQuizFinished = false;
    notifyListeners();
  }
}

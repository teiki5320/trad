import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/wolof_data.dart';
import '../models/phrase.dart';
import '../models/word.dart';

class AppState extends ChangeNotifier {
  static const _kFavWords = 'fav_words';
  static const _kFavPhrases = 'fav_phrases';
  static const _kLang = 'target_lang';
  static const _kTheme = 'theme_mode';

  String _targetLang = 'fr'; // 'fr' | 'en'
  ThemeMode _themeMode = ThemeMode.dark;
  final Set<String> _favWordIds = {};
  final Set<String> _favPhraseIds = {};
  String _searchQuery = '';
  String _selectedCategory = 'salutations';

  SharedPreferences? _prefs;

  String get targetLang => _targetLang;
  ThemeMode get themeMode => _themeMode;
  Set<String> get favWordIds => _favWordIds;
  Set<String> get favPhraseIds => _favPhraseIds;
  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;

  List<Word> get words => allWords;
  List<Phrase> get phrases => allPhrases;

  Future<void> load() async {
    _prefs = await SharedPreferences.getInstance();
    _targetLang = _prefs!.getString(_kLang) ?? 'fr';
    final theme = _prefs!.getString(_kTheme) ?? 'dark';
    _themeMode = theme == 'light' ? ThemeMode.light : ThemeMode.dark;
    _favWordIds
      ..clear()
      ..addAll(_prefs!.getStringList(_kFavWords) ?? const []);
    _favPhraseIds
      ..clear()
      ..addAll(_prefs!.getStringList(_kFavPhrases) ?? const []);
    notifyListeners();
  }

  // ---- Language ----
  void setLang(String lang) {
    if (lang != 'fr' && lang != 'en') return;
    _targetLang = lang;
    _prefs?.setString(_kLang, lang);
    notifyListeners();
  }

  void toggleLang() => setLang(_targetLang == 'fr' ? 'en' : 'fr');

  // ---- Theme ----
  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    _prefs?.setString(_kTheme, mode == ThemeMode.light ? 'light' : 'dark');
    notifyListeners();
  }

  void toggleTheme() =>
      setThemeMode(_themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);

  // ---- Search ----
  void setSearchQuery(String q) {
    _searchQuery = q;
    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    notifyListeners();
  }

  // ---- Category ----
  void setCategory(String id) {
    _selectedCategory = id;
    notifyListeners();
  }

  // ---- Favorites ----
  bool isFavWord(String id) => _favWordIds.contains(id);
  bool isFavPhrase(String id) => _favPhraseIds.contains(id);

  void toggleFavWord(String id) {
    if (!_favWordIds.add(id)) _favWordIds.remove(id);
    _prefs?.setStringList(_kFavWords, _favWordIds.toList());
    notifyListeners();
  }

  void toggleFavPhrase(String id) {
    if (!_favPhraseIds.add(id)) _favPhraseIds.remove(id);
    _prefs?.setStringList(_kFavPhrases, _favPhraseIds.toList());
    notifyListeners();
  }

  void removeFavWord(String id) {
    if (_favWordIds.remove(id)) {
      _prefs?.setStringList(_kFavWords, _favWordIds.toList());
      notifyListeners();
    }
  }

  void removeFavPhrase(String id) {
    if (_favPhraseIds.remove(id)) {
      _prefs?.setStringList(_kFavPhrases, _favPhraseIds.toList());
      notifyListeners();
    }
  }

  // ---- Queries ----
  List<Word> filteredWords({String? query}) {
    final q = (query ?? _searchQuery).trim().toLowerCase();
    if (q.isEmpty) return List.unmodifiable(allWords);
    return allWords.where((w) {
      return w.wolof.toLowerCase().contains(q) ||
          w.fr.toLowerCase().contains(q) ||
          w.en.toLowerCase().contains(q) ||
          w.pronunciation.toLowerCase().contains(q);
    }).toList();
  }

  List<Phrase> filteredPhrases({String? category, String? query}) {
    final cat = category ?? _selectedCategory;
    final q = (query ?? '').trim().toLowerCase();
    return allPhrases.where((p) {
      if (p.category != cat) return false;
      if (q.isEmpty) return true;
      return p.wolof.toLowerCase().contains(q) ||
          p.fr.toLowerCase().contains(q) ||
          p.en.toLowerCase().contains(q) ||
          p.pronunciation.toLowerCase().contains(q);
    }).toList();
  }

  List<Word> get favoriteWords =>
      allWords.where((w) => _favWordIds.contains(w.id)).toList();

  List<Phrase> get favoritePhrases =>
      allPhrases.where((p) => _favPhraseIds.contains(p.id)).toList();

  Word? get wordOfTheDay {
    if (allWords.isEmpty) return null;
    final dayIndex = DateTime.now().difference(DateTime(2024, 1, 1)).inDays;
    return allWords[dayIndex.abs() % allWords.length];
  }
}

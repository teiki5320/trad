import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/phrase_card.dart';
import '../widgets/word_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            labelColor: AppColors.gold,
            indicatorColor: AppColors.gold,
            tabs: [
              Tab(text: 'Mots'),
              Tab(text: 'Phrases'),
            ],
          ),
          const Expanded(
            child: TabBarView(
              children: [
                _FavWords(),
                _FavPhrases(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FavWords extends StatelessWidget {
  const _FavWords();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final words = state.favoriteWords;
    if (words.isEmpty) return const _Empty(label: 'Aucun mot favori');
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: words.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, i) {
        final w = words[i];
        return Dismissible(
          key: ValueKey('fw-${w.id}'),
          direction: DismissDirection.endToStart,
          background: _swipeBg(),
          onDismissed: (_) => context.read<AppState>().removeFavWord(w.id),
          child: WordCard(word: w),
        );
      },
    );
  }
}

class _FavPhrases extends StatelessWidget {
  const _FavPhrases();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final phrases = state.favoritePhrases;
    if (phrases.isEmpty) return const _Empty(label: 'Aucune phrase favorite');
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: phrases.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, i) {
        final p = phrases[i];
        return Dismissible(
          key: ValueKey('fp-${p.id}'),
          direction: DismissDirection.endToStart,
          background: _swipeBg(),
          onDismissed: (_) => context.read<AppState>().removeFavPhrase(p.id),
          child: PhraseCard(phrase: p),
        );
      },
    );
  }
}

Widget _swipeBg() => Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.red.shade700,
        borderRadius: BorderRadius.circular(AppTheme.radius),
      ),
      child: const Icon(Icons.delete_outline, color: Colors.white),
    );

class _Empty extends StatelessWidget {
  final String label;
  const _Empty({required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.favorite_border, size: 56, color: AppColors.gold),
          const SizedBox(height: 12),
          Text(label, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}

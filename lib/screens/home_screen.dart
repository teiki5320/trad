import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/search_bar.dart';
import '../widgets/word_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final results = _query.isEmpty ? const [] : state.filteredWords(query: _query);
    final wod = state.wordOfTheDay;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        _Logo(),
        const SizedBox(height: 20),
        AppSearchBar(
          hint: 'Rechercher un mot, une phrase…',
          value: _query,
          onChanged: (v) => setState(() => _query = v),
        ),
        const SizedBox(height: 16),
        if (_query.isNotEmpty) ...[
          Text('Résultats (${results.length})',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          ...results.take(20).map((w) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: WordCard(word: w),
              )),
          if (results.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Aucun résultat', textAlign: TextAlign.center),
            ),
        ] else ...[
          _StatsRow(
            words: state.words.length,
            phrases: state.phrases.length,
            favs: state.favWordIds.length + state.favPhraseIds.length,
          ),
          const SizedBox(height: 20),
          if (wod != null) ...[
            Text('Mot du jour', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            WordCard(word: wod),
          ],
        ],
      ],
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: AppColors.gold.withOpacity(0.12),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.gold, width: 2),
          ),
          alignment: Alignment.center,
          child: const Text(
            'VL',
            style: TextStyle(
              color: AppColors.gold,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'VoixLocal',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          'Wolof ↔ Français / English',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _StatsRow extends StatelessWidget {
  final int words;
  final int phrases;
  final int favs;

  const _StatsRow({required this.words, required this.phrases, required this.favs});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _StatCard(value: '$words', label: 'Mots', color: AppColors.gold)),
        const SizedBox(width: 10),
        Expanded(child: _StatCard(value: '$phrases', label: 'Phrases', color: AppColors.green)),
        const SizedBox(width: 10),
        Expanded(child: _StatCard(value: '$favs', label: 'Favoris', color: AppColors.gold)),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  const _StatCard({required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(label, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

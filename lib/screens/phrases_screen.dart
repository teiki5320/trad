import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/phrase.dart';
import '../providers/app_state.dart';
import '../widgets/phrase_card.dart';

class PhrasesScreen extends StatelessWidget {
  const PhrasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final phrases = state.filteredPhrases();

    return Column(
      children: [
        SizedBox(
          height: 56,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            itemCount: allCategories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (_, i) {
              final c = allCategories[i];
              final selected = c.id == state.selectedCategory;
              return ChoiceChip(
                label: Text('${c.emoji} ${c.label(state.targetLang)}'),
                selected: selected,
                onSelected: (_) => context.read<AppState>().setCategory(c.id),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                '${phrases.length} phrase${phrases.length > 1 ? 's' : ''}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: phrases.isEmpty
              ? const Center(child: Text('Aucune phrase dans cette catégorie'))
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  itemCount: phrases.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) => PhraseCard(phrase: phrases[i]),
                ),
        ),
      ],
    );
  }
}

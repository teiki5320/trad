import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/word.dart';
import '../providers/app_state.dart';
import '../theme/app_theme.dart';

class WordCard extends StatelessWidget {
  final Word word;
  const WordCard({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final isFav = state.isFavWord(word.id);
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 8, 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    word.wolof,
                    style: textTheme.titleMedium?.copyWith(
                      color: AppColors.gold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '[${word.pronunciation}]',
                    style: textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    word.translation(state.targetLang),
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            IconButton(
              tooltip: isFav ? 'Retirer des favoris' : 'Ajouter aux favoris',
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? AppColors.gold : null,
              ),
              onPressed: () => context.read<AppState>().toggleFavWord(word.id),
            ),
          ],
        ),
      ),
    );
  }
}

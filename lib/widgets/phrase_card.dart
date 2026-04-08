import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/phrase.dart';
import '../providers/app_state.dart';
import '../theme/app_theme.dart';

class PhraseCard extends StatelessWidget {
  final Phrase phrase;
  const PhraseCard({super.key, required this.phrase});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final isFav = state.isFavPhrase(phrase.id);
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
                    phrase.wolof,
                    style: textTheme.titleMedium?.copyWith(
                      color: AppColors.gold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '[${phrase.pronunciation}]',
                    style: textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    phrase.translation(state.targetLang),
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
              onPressed: () => context.read<AppState>().toggleFavPhrase(phrase.id),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_state.dart';
import '../theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final isDark = state.themeMode == ThemeMode.dark;
    final isEn = state.targetLang == 'en';

    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  value: isEn,
                  onChanged: (v) =>
                      context.read<AppState>().setLang(v ? 'en' : 'fr'),
                  title: const Text('Langue cible'),
                  subtitle: Text(isEn ? 'English' : 'Français'),
                  secondary: const Icon(Icons.translate, color: AppColors.gold),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  value: isDark,
                  onChanged: (v) => context
                      .read<AppState>()
                      .setThemeMode(v ? ThemeMode.dark : ThemeMode.light),
                  title: const Text('Thème sombre'),
                  subtitle: Text(isDark ? 'Activé' : 'Désactivé'),
                  secondary: Icon(
                    isDark ? Icons.dark_mode : Icons.light_mode,
                    color: AppColors.gold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.info_outline, color: AppColors.gold),
              title: const Text('À propos'),
              subtitle: const Text('VoixLocal • Dictionnaire Wolof hors-ligne'),
              onTap: () => showAboutDialog(
                context: context,
                applicationName: 'VoixLocal',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2026 Afrotok',
                children: const [
                  SizedBox(height: 12),
                  Text(
                    'Dictionnaire et phrasier Wolof ↔ Français / English. '
                    '100% hors-ligne, optimisé pour smartphones Android en '
                    'Afrique de l\'Ouest.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

# VoixLocal

Dictionnaire et phrasier **Wolof ↔ Français / English**, 100 % hors-ligne.
App Flutter optimisée pour smartphones Android en Afrique de l'Ouest.

- **Package** : `com.afrotok.voixlocal`
- **Nom** : VoixLocal

## Fonctionnalités

- Bottom navigation : Accueil / Dictionnaire / Phrases / Favoris
- Recherche instantanée dans les mots et les phrases
- Phrases filtrables par catégorie (chips horizontaux)
- Favoris persistants (Mots et Phrases)
- Thème sombre (défaut) / clair
- Bascule langue cible : Français / English
- Mot du jour
- Aucune connexion requise

## Stack

- Flutter (Dart ≥ 3.3)
- `provider` (state management)
- `shared_preferences` (favoris + paramètres)

## Arborescence

```
lib/
├── main.dart
├── models/        # Word, Phrase, PhraseCategory
├── data/          # wolof_data.dart (mots & phrases)
├── providers/     # AppState (ChangeNotifier)
├── theme/         # AppTheme (sombre/clair)
├── widgets/       # WordCard, PhraseCard, AppSearchBar
└── screens/       # home, dictionary, phrases, favorites, settings
```

## Données

Les données sont chargées depuis `lib/data/wolof_data.dart`, qui exporte :

```dart
final List<Word> allWords;
final List<Phrase> allPhrases;
```

Le fichier actuel contient un **stub minimal** (quelques mots / phrases) pour
permettre à l'app de compiler. Pour brancher le jeu de données complet
(850 mots + 160 phrases) :

1. Déposer le vrai `wolof_data.dart` dans `lib/data/` en écrasant le stub, **ou**
2. Remplacer uniquement le contenu des deux listes `allWords` et `allPhrases` ;
   rien d'autre dans l'app ne doit changer.

Les écrans, widgets et provider lisent toujours via ces deux listes.

## Développement

```bash
# Prérequis : Flutter SDK installé (>= 3.19)
flutter --version

# Générer les dossiers de plateforme (android/ios/web/…)
flutter create --org com.afrotok --project-name voixlocal .

# Récupérer les dépendances
flutter pub get

# Lancer en debug
flutter run                    # device connecté
flutter run -d chrome          # web

# Builds release
flutter build apk --release
flutter build appbundle --release
```

> `flutter create .` n'écrase pas les fichiers déjà présents dans `lib/`.
> Il ajoute seulement les dossiers `android/`, `ios/`, `web/`, etc.

## Thème

- **Sombre (défaut)** — background `#121212`, cards `#1E1E1E`
- **Clair** — background `#F5F5F5`, cards `#FFFFFF`
- **Accent or** `#D4AF37`, **accent vert** `#1D9E75`
- **Radius** des cards : 12 px — **boutons** : min 48 px

## Catégories de phrases

| id            | emoji | label               |
|---------------|-------|---------------------|
| salutations   | 👋    | Salutations         |
| marche        | 🛒    | Marché              |
| sante         | 🏥    | Santé               |
| transport     | 🚕    | Transport           |
| nourriture    | 🍲    | Nourriture          |
| famille       | 👨‍👩‍👧 | Famille             |
| nombres       | 🔢    | Nombres             |
| temps         | 🕐    | Temps               |
| expressions   | 💬    | Expressions         |
| urgences      | 🆘    | Urgences            |

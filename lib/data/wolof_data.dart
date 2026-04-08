import '../models/word.dart';
import '../models/phrase.dart';

// =============================================================================
// VoixLocal — Données du dictionnaire et du phrasier
// =============================================================================
//
// Ce fichier contient des listes factices (stub) pour que l'app compile.
// Remplace le contenu de `allWords` et `allPhrases` par le vrai `wolof-data.dart`
// complet (850 mots + 160 phrases).
//
// Les écrans lisent uniquement `allWords` et `allPhrases` depuis ici, donc il
// suffit d'écraser ces deux listes et rien d'autre ne change.
// =============================================================================

final List<Word> allWords = [
  Word(id: "w001", wolof: "salaam", pronunciation: "sa-laam", fr: "paix / bonjour", en: "peace / hello"),
  Word(id: "w002", wolof: "jërëjëf", pronunciation: "djeu-reu-djeuf", fr: "merci", en: "thank you"),
  Word(id: "w003", wolof: "waaw", pronunciation: "waaw", fr: "oui", en: "yes"),
  Word(id: "w004", wolof: "déedéet", pronunciation: "dey-deyt", fr: "non", en: "no"),
  Word(id: "w005", wolof: "kër", pronunciation: "keur", fr: "maison", en: "house"),
];

final List<Phrase> allPhrases = [
  Phrase(id: "p001", category: "salutations", wolof: "Salaam aleekum", pronunciation: "sa-laam a-ley-kum", fr: "Bonjour (paix sur vous)", en: "Hello (peace be upon you)"),
  Phrase(id: "p002", category: "salutations", wolof: "Nanga def?", pronunciation: "nan-ga def", fr: "Comment ça va ?", en: "How are you?"),
  Phrase(id: "p003", category: "salutations", wolof: "Mangi fi rekk", pronunciation: "man-gi fi rek", fr: "Je vais bien", en: "I'm fine"),
  Phrase(id: "p004", category: "marche", wolof: "Ñaata lay jar?", pronunciation: "nya-ta lay djar", fr: "Combien ça coûte ?", en: "How much is it?"),
  Phrase(id: "p005", category: "urgences", wolof: "Wallu ma!", pronunciation: "wa-lu ma", fr: "Aidez-moi !", en: "Help me!"),
];

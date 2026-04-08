class Phrase {
  final String id;
  final String category;
  final String wolof;
  final String pronunciation;
  final String fr;
  final String en;

  const Phrase({
    required this.id,
    required this.category,
    required this.wolof,
    required this.pronunciation,
    required this.fr,
    required this.en,
  });

  String translation(String lang) => lang == 'en' ? en : fr;
}

class PhraseCategory {
  final String id;
  final String emoji;
  final String labelFr;
  final String labelEn;

  const PhraseCategory({
    required this.id,
    required this.emoji,
    required this.labelFr,
    required this.labelEn,
  });

  String label(String lang) => lang == 'en' ? labelEn : labelFr;
}

const List<PhraseCategory> allCategories = [
  PhraseCategory(id: 'salutations', emoji: '👋', labelFr: 'Salutations', labelEn: 'Greetings'),
  PhraseCategory(id: 'marche', emoji: '🛒', labelFr: 'Marché', labelEn: 'Market'),
  PhraseCategory(id: 'sante', emoji: '🏥', labelFr: 'Santé', labelEn: 'Health'),
  PhraseCategory(id: 'transport', emoji: '🚕', labelFr: 'Transport', labelEn: 'Transport'),
  PhraseCategory(id: 'nourriture', emoji: '🍲', labelFr: 'Nourriture', labelEn: 'Food'),
  PhraseCategory(id: 'famille', emoji: '👨‍👩‍👧', labelFr: 'Famille', labelEn: 'Family'),
  PhraseCategory(id: 'nombres', emoji: '🔢', labelFr: 'Nombres', labelEn: 'Numbers'),
  PhraseCategory(id: 'temps', emoji: '🕐', labelFr: 'Temps', labelEn: 'Time'),
  PhraseCategory(id: 'expressions', emoji: '💬', labelFr: 'Expressions', labelEn: 'Expressions'),
  PhraseCategory(id: 'urgences', emoji: '🆘', labelFr: 'Urgences', labelEn: 'Emergencies'),
];

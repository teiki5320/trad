class Word {
  final String id;
  final String wolof;
  final String pronunciation;
  final String fr;
  final String en;

  const Word({
    required this.id,
    required this.wolof,
    required this.pronunciation,
    required this.fr,
    required this.en,
  });

  String translation(String lang) => lang == 'en' ? en : fr;
}

class Ayah {
  final int id;
  final int surahNumber;
  final int number;
  final String arabicText;
  final String translation;
  final String? audioUrl;

  const Ayah({
    required this.id,
    required this.surahNumber,
    required this.number,
    required this.arabicText,
    required this.translation,
    this.audioUrl,
  });
}

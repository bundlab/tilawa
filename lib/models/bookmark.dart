class Bookmark {
  final int id;
  final int surahNumber;
  final int ayahNumber;
  final String surahName;
  final String? note;

  const Bookmark({
    required this.id,
    required this.surahNumber,
    required this.ayahNumber,
    required this.surahName,
    this.note,
  });
}

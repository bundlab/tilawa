class QuranAudioCatalog {
  QuranAudioCatalog._();

  static const String _baseUrl =
      'https://everyayah.com/data';

  static const Map<String, String> reciters = {
    'mishary_alafasy':
        'Alafasy_128kbps',
    'abu_bakr_ash_shatri':
        'Abu_Bakr_Ash-Shaatree_128kbps',
    'mahmoud_al_husary':
        'Husary_128kbps',
  };

  static String ayahUrl({
    required int surahNumber,
    required int ayahNumber,
    String reciterId = 'mishary_alafasy',
  }) {
    if (surahNumber < 1 || surahNumber > 114) {
      throw ArgumentError.value(
        surahNumber,
        'surahNumber',
        'Must be between 1 and 114.',
      );
    }

    if (ayahNumber < 1 || ayahNumber > 286) {
      throw ArgumentError.value(
        ayahNumber,
        'ayahNumber',
        'Must be between 1 and 286.',
      );
    }

    final folder = reciters[reciterId];

    if (folder == null) {
      throw ArgumentError.value(
        reciterId,
        'reciterId',
        'Unsupported reciter.',
      );
    }

    final surah = surahNumber.toString().padLeft(3, '0');
    final ayah = ayahNumber.toString().padLeft(3, '0');

    return '$_baseUrl/$folder/$surah$ayah.mp3';
  }
}


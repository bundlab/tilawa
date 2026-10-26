
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/ayah.dart';

class QuranDataService {
  QuranDataService({http.Client? client})
      : _client = client ?? http.Client();

  final http.Client _client;

  static const String _baseUrl = 'https://api.alquran.cloud/v1';

  Future<List<Ayah>> fetchSurah(int surahNumber) async {
    if (surahNumber < 1 || surahNumber > 114) {
      throw ArgumentError.value(
        surahNumber,
        'surahNumber',
        'Must be between 1 and 114.',
      );
    }

    final arabicUri = Uri.parse('$_baseUrl/surah/$surahNumber');
    final translationUri =
        Uri.parse('$_baseUrl/surah/$surahNumber/en.sahih');

    final responses = await Future.wait([
      _client.get(arabicUri).timeout(const Duration(seconds: 20)),
      _client.get(translationUri).timeout(const Duration(seconds: 20)),
    ]);

    for (final response in responses) {
      if (response.statusCode != 200) {
        throw Exception(
          'Quran API request failed with HTTP ${response.statusCode}.',
        );
      }
    }

    final arabicData =
        jsonDecode(responses[0].body) as Map<String, dynamic>;
    final translationData =
        jsonDecode(responses[1].body) as Map<String, dynamic>;

    if (arabicData['code'] != 200 ||
        translationData['code'] != 200) {
      throw Exception('The Quran API returned an unsuccessful response.');
    }

    final arabicResult = arabicData['data'] as Map<String, dynamic>;
    final translationResult =
        translationData['data'] as Map<String, dynamic>;

    final arabicAyahs =
        arabicResult['ayahs'] as List<dynamic>;
    final translatedAyahs =
        translationResult['ayahs'] as List<dynamic>;

    if (arabicAyahs.length != translatedAyahs.length) {
      throw Exception(
        'Arabic and translation Ayah counts do not match.',
      );
    }

    return List<Ayah>.generate(arabicAyahs.length, (index) {
      final arabic = arabicAyahs[index] as Map<String, dynamic>;
      final translated =
          translatedAyahs[index] as Map<String, dynamic>;

      final number = arabic['numberInSurah'] as int;

      if (number != translated['numberInSurah']) {
        throw Exception('Ayah numbering mismatch at index $index.');
      }

      return Ayah(
        id: (surahNumber * 1000) + number,
        surahNumber: surahNumber,
        number: number,
        arabicText: arabic['text'] as String,
        translation: translated['text'] as String,
      );
    });
  }

  void dispose() {
    _client.close();
  }
}

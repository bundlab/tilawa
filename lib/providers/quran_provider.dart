import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/mock_data.dart';
import '../models/ayah.dart';
import '../models/surah.dart';

final surahsProvider = Provider<List<Surah>>((ref) {
  return surahs;
});

final fatihahAyahsProvider = Provider<List<Ayah>>((ref) {
  return fatihahAyahs;
});

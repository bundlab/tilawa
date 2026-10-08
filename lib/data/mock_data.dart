import '../models/ayah.dart';
import '../models/bookmark.dart';
import '../models/reciter.dart';
import '../models/surah.dart';

const surahs = [
  Surah(
    number: 1,
    nameArabic: 'الفاتحة',
    nameEnglish: 'The Opening',
    transliteration: 'Al-Fatihah',
    ayahCount: 7,
    revelationType: 'Meccan',
  ),
  Surah(
    number: 2,
    nameArabic: 'البقرة',
    nameEnglish: 'The Cow',
    transliteration: 'Al-Baqarah',
    ayahCount: 286,
    revelationType: 'Medinan',
  ),
  Surah(
    number: 3,
    nameArabic: 'آل عمران',
    nameEnglish: 'Family of Imran',
    transliteration: 'Aal-E-Imran',
    ayahCount: 200,
    revelationType: 'Medinan',
  ),
  Surah(
    number: 4,
    nameArabic: 'النساء',
    nameEnglish: 'The Women',
    transliteration: 'An-Nisa',
    ayahCount: 176,
    revelationType: 'Medinan',
  ),
  Surah(
    number: 5,
    nameArabic: 'المائدة',
    nameEnglish: 'The Table',
    transliteration: 'Al-Maidah',
    ayahCount: 120,
    revelationType: 'Medinan',
  ),
];

const reciters = [
  Reciter(
    id: 1,
    name: 'Mishary Rashid Alafasy',
    country: 'Kuwait',
    style: 'Murattal',
  ),
  Reciter(
    id: 2,
    name: 'Abdul Rahman Al-Sudais',
    country: 'Saudi Arabia',
    style: 'Murattal',
  ),
  Reciter(
    id: 3,
    name: 'Maher Al-Muaiqly',
    country: 'Saudi Arabia',
    style: 'Murattal',
  ),
  Reciter(
    id: 4,
    name: 'Saad Al-Ghamdi',
    country: 'Saudi Arabia',
    style: 'Murattal',
  ),
];

const fatihahAyahs = [
  Ayah(
    id: 1,
    surahNumber: 1,
    number: 1,
    arabicText: 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
    translation: 'In the name of Allah, the Most Compassionate, Most Merciful.',
  ),
  Ayah(
    id: 2,
    surahNumber: 1,
    number: 2,
    arabicText: 'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
    translation: 'All praise is for Allah—Lord of all worlds.',
  ),
  Ayah(
    id: 3,
    surahNumber: 1,
    number: 3,
    arabicText: 'الرَّحْمَٰنِ الرَّحِيمِ',
    translation: 'The Most Compassionate, Most Merciful.',
  ),
  Ayah(
    id: 4,
    surahNumber: 1,
    number: 4,
    arabicText: 'مَالِكِ يَوْمِ الدِّينِ',
    translation: 'Master of the Day of Judgment.',
  ),
  Ayah(
    id: 5,
    surahNumber: 1,
    number: 5,
    arabicText: 'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
    translation: 'You alone we worship and You alone we ask for help.',
  ),
  Ayah(
    id: 6,
    surahNumber: 1,
    number: 6,
    arabicText: 'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ',
    translation: 'Guide us along the Straight Path.',
  ),
  Ayah(
    id: 7,
    surahNumber: 1,
    number: 7,
    arabicText:
        'صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ',
    translation:
        'The path of those You have blessed—not those You are displeased with, or those who are astray.',
  ),
];

const bookmarks = [
  Bookmark(
    id: 1,
    surahNumber: 1,
    ayahNumber: 1,
    surahName: 'Al-Fatihah',
    note: 'Beginning of the Quran',
  ),
];

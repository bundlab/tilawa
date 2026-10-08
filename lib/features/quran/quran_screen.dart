import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/quran_provider.dart';
import '../../widgets/bottom_navigation.dart';

class QuranScreen extends ConsumerStatefulWidget {
  const QuranScreen({super.key});

  @override
  ConsumerState<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends ConsumerState<QuranScreen> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    final surahs = ref.watch(surahsProvider);

    final filtered = surahs.where((surah) {
      return surah.transliteration.toLowerCase().contains(search.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quran',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
            child: TextField(
              onChanged: (value) {
                setState(() => search = value);
              },
              decoration: InputDecoration(
                hintText: 'Search Surah',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final surah = filtered[index];

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${surah.number}')),
                    title: Text(
                      surah.transliteration,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${surah.nameEnglish} • ${surah.ayahCount} Ayahs',
                    ),
                    trailing: Text(
                      surah.nameArabic,
                      style: const TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      context.push('/surah/${surah.number}');
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const TilawaBottomNavigation(currentIndex: 1),
    );
  }
}

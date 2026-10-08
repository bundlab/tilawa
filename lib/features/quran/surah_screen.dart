import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/quran_provider.dart';

class SurahScreen extends ConsumerWidget {
  final int surahNumber;

  const SurahScreen({super.key, required this.surahNumber});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final surahs = ref.watch(surahsProvider);

    final surah = surahs.firstWhere((item) => item.number == surahNumber);

    final ayahs = ref.watch(fatihahAyahsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(surah.transliteration)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    surah.nameArabic,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    surah.nameEnglish,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text('${surah.ayahCount} Ayahs • ${surah.revelationType}'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          ...ayahs.map(
            (ayah) => Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(radius: 16, child: Text('${ayah.number}')),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.play_circle_outline),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_outline),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      ayah.arabicText,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        fontSize: 27,
                        height: 1.8,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      ayah.translation,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/player'),
        icon: const Icon(Icons.play_arrow),
        label: const Text('Play'),
      ),
    );
  }
}

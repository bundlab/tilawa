import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/bookmark_provider.dart';
import '../../widgets/bottom_navigation.dart';

class BookmarksScreen extends ConsumerWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarksProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bookmarks',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: bookmarks.isEmpty
          ? const Center(child: Text('No bookmarks yet.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                final bookmark = bookmarks[index];

                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: Text(
                      '${bookmark.surahName} — Ayah ${bookmark.ayahNumber}',
                    ),
                    subtitle: bookmark.note == null
                        ? null
                        : Text(bookmark.note!),
                    trailing: IconButton(
                      onPressed: () {
                        ref
                            .read(bookmarksProvider.notifier)
                            .removeBookmark(bookmark.id);
                      },
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: const TilawaBottomNavigation(currentIndex: 2),
    );
  }
}

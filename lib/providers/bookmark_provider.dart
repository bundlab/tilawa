import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/mock_data.dart';
import '../models/bookmark.dart';

final bookmarksProvider = NotifierProvider<BookmarksNotifier, List<Bookmark>>(
  BookmarksNotifier.new,
);

class BookmarksNotifier extends Notifier<List<Bookmark>> {
  @override
  List<Bookmark> build() {
    return List<Bookmark>.from(bookmarks);
  }

  void addBookmark(Bookmark bookmark) {
    final exists = state.any(
      (item) =>
          item.surahNumber == bookmark.surahNumber &&
          item.ayahNumber == bookmark.ayahNumber,
    );

    if (exists) {
      return;
    }

    state = [...state, bookmark];
  }

  void removeBookmark(int bookmarkId) {
    state = state.where((bookmark) => bookmark.id != bookmarkId).toList();
  }

  bool isBookmarked({required int surahNumber, required int ayahNumber}) {
    return state.any(
      (bookmark) =>
          bookmark.surahNumber == surahNumber &&
          bookmark.ayahNumber == ayahNumber,
    );
  }
}

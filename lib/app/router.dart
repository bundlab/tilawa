import 'package:go_router/go_router.dart';

import '../features/bookmarks/bookmarks_screen.dart';
import '../features/home/home_screen.dart';
import '../features/player/player_screen.dart';
import '../features/quran/quran_screen.dart';
import '../features/quran/surah_screen.dart';
import '../features/reciters/reciters_screen.dart';
import '../features/settings/settings_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/quran', builder: (context, state) => const QuranScreen()),
    GoRoute(
      path: '/surah/:number',
      builder: (context, state) {
        final number = int.parse(state.pathParameters['number']!);

        return SurahScreen(surahNumber: number);
      },
    ),
    GoRoute(
      path: '/reciters',
      builder: (context, state) => const RecitersScreen(),
    ),
    GoRoute(path: '/player', builder: (context, state) => const PlayerScreen()),
    GoRoute(
      path: '/bookmarks',
      builder: (context, state) => const BookmarksScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);

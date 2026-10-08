import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/constants.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            AppLogo(size: 42),
            SizedBox(width: 12),
            Text('Tilawa', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConstants.pagePadding),
        children: [
          Text(
            'Assalamu Alaikum',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            'Continue your Quran journey.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),

          // Continue listening
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Continue Listening',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Al-Baqarah',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text('Ayah 255'),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: () => context.push('/player'),
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Continue'),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 28),

          Text(
            'Quick Access',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 14),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.45,
            children: [
              _QuickAccessCard(
                icon: Icons.menu_book,
                title: 'Quran',
                onTap: () => context.push('/quran'),
              ),
              _QuickAccessCard(
                icon: Icons.mic,
                title: 'Reciters',
                onTap: () => context.push('/reciters'),
              ),
              _QuickAccessCard(
                icon: Icons.bookmark,
                title: 'Bookmarks',
                onTap: () => context.push('/bookmarks'),
              ),
              _QuickAccessCard(
                icon: Icons.download,
                title: 'Downloads',
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 28),

          Text(
            'Popular Reciters',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 14),

          const _ReciterPreview(
            name: 'Mishary Rashid Alafasy',
            country: 'Kuwait',
          ),
          const _ReciterPreview(
            name: 'Abdul Rahman Al-Sudais',
            country: 'Saudi Arabia',
          ),
          const _ReciterPreview(
            name: 'Maher Al-Muaiqly',
            country: 'Saudi Arabia',
          ),
        ],
      ),
      bottomNavigationBar: const TilawaBottomNavigation(currentIndex: 0),
    );
  }
}

class _QuickAccessCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _QuickAccessCard({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReciterPreview extends StatelessWidget {
  final String name;
  final String country;

  const _ReciterPreview({required this.name, required this.country});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(
            Icons.person,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        title: Text(name),
        subtitle: Text(country),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.push('/reciters'),
      ),
    );
  }
}

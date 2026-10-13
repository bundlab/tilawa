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
        titleSpacing: AppConstants.pagePadding,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppLogo(size: 42),
            SizedBox(width: 12),
            Text(
              'Tilawa',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Search',
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= 1000;
          final isTablet = constraints.maxWidth >= 650;

          final horizontalPadding = isDesktop
              ? 40.0
              : isTablet
                  ? 28.0
                  : AppConstants.pagePadding;

          final contentWidth = isDesktop ? 1200.0 : double.infinity;

          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: contentWidth),
              child: ListView(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  24,
                  horizontalPadding,
                  32,
                ),
                children: [
                  _WelcomeHeader(
                    isDesktop: isDesktop,
                  ),

                  const SizedBox(height: 28),

                  const _ContinueListeningCard(),

                  const SizedBox(height: 32),

                  const _SectionHeader(
                    title: 'Quick Access',
                    subtitle: 'Everything you need, one tap away',
                  ),

                  const SizedBox(height: 14),

                  _QuickAccessGrid(
                    isDesktop: isDesktop,
                    isTablet: isTablet,
                  ),

                  const SizedBox(height: 32),

                  _SectionHeader(
                    title: 'Popular Reciters',
                    subtitle: 'Listen to your favorite recitations',
                    actionLabel: 'View all',
                    onAction: () => context.push('/reciters'),
                  ),

                  const SizedBox(height: 14),

                  _PopularReciters(
                    isDesktop: isDesktop,
                  ),

                  const SizedBox(height: 32),

                  _SectionHeader(
                    title: 'Recently Played',
                    subtitle: 'Continue where you left off',
                  ),

                  const SizedBox(height: 14),

                  const _RecentlyPlayedCard(),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const TilawaBottomNavigation(
        currentIndex: 0,
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Welcome Header
// -----------------------------------------------------------------------------

class _WelcomeHeader extends StatelessWidget {
  final bool isDesktop;

  const _WelcomeHeader({
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Assalamu Alaikum',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Continue your Quran journey.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        if (isDesktop)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.auto_awesome,
                  size: 18,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Your Quran Companion',
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// Continue Listening
// -----------------------------------------------------------------------------

class _ContinueListeningCard extends StatelessWidget {
  const _ContinueListeningCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Card(
      elevation: 0,
      color: colors.primaryContainer,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/player'),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxWidth < 500;

              if (compact) {
                return const _ContinueListeningCompact();
              }

              return const _ContinueListeningWide();
            },
          ),
        ),
      ),
    );
  }
}

class _ContinueListeningWide extends StatelessWidget {
  const _ContinueListeningWide();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Row(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: colors.primary.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(
            Icons.menu_book_rounded,
            size: 32,
            color: colors.primary,
          ),
        ),
        const SizedBox(width: 18),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SmallLabel(text: 'CONTINUE LISTENING'),
              SizedBox(height: 6),
              Text(
                'Al-Baqarah',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text('Ayah 255 • Ayat al-Kursi'),
            ],
          ),
        ),
        const SizedBox(width: 16),
        FilledButton.icon(
	  onPressed: () => context.push('/player'),
	  icon: const Icon(Icons.play_arrow_rounded),
	  label: const Text('Continue'),
	),
      ],
    );
  }
}

class _ContinueListeningCompact extends StatelessWidget {
  const _ContinueListeningCompact();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SmallLabel(text: 'CONTINUE LISTENING'),
        const SizedBox(height: 8),
        Text(
          'Al-Baqarah',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        const Text('Ayah 255 • Ayat al-Kursi'),
        const SizedBox(height: 18),
        Align(
          alignment: Alignment.centerLeft,
          child: FilledButton.icon(
            onPressed: () => context.push('/player'),
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('Continue'),
          ),
        ),
      ],
    );
  }
}

class _SmallLabel extends StatelessWidget {
  final String text;

  const _SmallLabel({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        fontWeight: FontWeight.bold,
        letterSpacing: 0.8,
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Section Header
// -----------------------------------------------------------------------------

class _SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;

  const _SectionHeader({
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        if (actionLabel != null)
          TextButton(
            onPressed: onAction,
            child: Text(actionLabel!),
          ),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// Quick Access
// -----------------------------------------------------------------------------

class _QuickAccessGrid extends StatelessWidget {
  final bool isDesktop;
  final bool isTablet;

  const _QuickAccessGrid({
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = isDesktop
        ? 4
        : isTablet
            ? 2
            : 2;

    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        childAspectRatio: isDesktop ? 1.7 : 1.5,
      ),
      children: [
        _QuickAccessCard(
          icon: Icons.menu_book_rounded,
          title: 'Quran',
          subtitle: 'Read the Quran',
          onTap: () => context.push('/quran'),
        ),
        _QuickAccessCard(
          icon: Icons.mic_rounded,
          title: 'Reciters',
          subtitle: 'Explore recitations',
          onTap: () => context.push('/reciters'),
        ),
        _QuickAccessCard(
          icon: Icons.bookmark_rounded,
          title: 'Saved',
          subtitle: 'Your bookmarks',
          onTap: () => context.push('/bookmarks'),
        ),
        _QuickAccessCard(
          icon: Icons.download_rounded,
          title: 'Downloads',
          subtitle: 'Offline audio',
          onTap: () {},
        ),
      ],
    );
  }
}

class _QuickAccessCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _QuickAccessCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  State<_QuickAccessCard> createState() => _QuickAccessCardState();
}

class _QuickAccessCardState extends State<_QuickAccessCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        transform: Matrix4.translationValues(
          0,
          _hovering ? -3 : 0,
          0,
        ),
        child: Card(
          elevation: _hovering ? 3 : 0,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: colors.primaryContainer,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      widget.icon,
                      color: colors.primary,
                      size: 25,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: colors.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Popular Reciters
// -----------------------------------------------------------------------------

class _PopularReciters extends StatelessWidget {
  final bool isDesktop;

  const _PopularReciters({
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final reciters = const [
      (
        name: 'Mishary Rashid Alafasy',
        country: 'Kuwait',
      ),
      (
        name: 'Abdul Rahman Al-Sudais',
        country: 'Saudi Arabia',
      ),
      (
        name: 'Maher Al-Muaiqly',
        country: 'Saudi Arabia',
      ),
      (
        name: 'Saad Al-Ghamdi',
        country: 'Saudi Arabia',
      ),
    ];

    if (isDesktop) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: reciters.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          childAspectRatio: 1.35,
        ),
        itemBuilder: (context, index) {
          final reciter = reciters[index];

          return _ReciterPreview(
            name: reciter.name,
            country: reciter.country,
          );
        },
      );
    }

    return Column(
      children: [
        for (final reciter in reciters) ...[
          _ReciterPreview(
            name: reciter.name,
            country: reciter.country,
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _ReciterPreview extends StatefulWidget {
  final String name;
  final String country;

  const _ReciterPreview({
    required this.name,
    required this.country,
  });

  @override
  State<_ReciterPreview> createState() => _ReciterPreviewState();
}

class _ReciterPreviewState extends State<_ReciterPreview> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        transform: Matrix4.translationValues(
          0,
          _hovering ? -2 : 0,
          0,
        ),
        child: Card(
          elevation: _hovering ? 3 : 0,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => context.push('/reciters'),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: colors.primaryContainer,
                    child: Icon(
                      Icons.person_rounded,
                      color: colors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.country,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: colors.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Recently Played
// -----------------------------------------------------------------------------

class _RecentlyPlayedCard extends StatelessWidget {
  const _RecentlyPlayedCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/player'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: colors.primaryContainer,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  Icons.play_circle_fill_rounded,
                  color: colors.primary,
                  size: 30,
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Al-Baqarah',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Mishary Rashid Alafasy • Ayah 255',
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.play_arrow_rounded,
                color: colors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

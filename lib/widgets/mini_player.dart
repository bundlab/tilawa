import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/audio_provider.dart';

class TilawaMiniPlayer extends ConsumerWidget {
  const TilawaMiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(audioPlayerServiceProvider);
    final playerState = ref.watch(playerStateProvider).value;
    final position = ref.watch(positionProvider).value ?? Duration.zero;
    final duration = ref.watch(durationProvider).value ?? Duration.zero;

    if (!service.hasAudio) {
      return const SizedBox.shrink();
    }

    final playing = playerState?.playing ?? false;
    final totalMs = duration.inMilliseconds;
    final currentMs = position.inMilliseconds;
    final progress = totalMs > 0
        ? (currentMs / totalMs).clamp(0.0, 1.0)
        : 0.0;

    return Material(
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(
            value: progress,
            minHeight: 2,
          ),
          ListTile(
            onTap: () => context.push('/player'),
            leading: Icon(
              Icons.graphic_eq_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              service.currentTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              service.currentArtist,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              tooltip: playing ? 'Pause' : 'Play',
              onPressed: () async {
                await service.toggle();
              },
              icon: Icon(
                playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


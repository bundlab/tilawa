import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/audio_provider.dart';

class PlayerScreen extends ConsumerWidget {
  const PlayerScreen({super.key});

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    final hours = duration.inHours;

    if (hours > 0) {
      return '$hours:$minutes:$seconds';
    }
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(audioPlayerServiceProvider);
    final playing = ref.watch(isPlayingProvider);
    final position = ref.watch(positionProvider).value ?? Duration.zero;
    final duration = ref.watch(durationProvider).value ?? Duration.zero;
    final speed = ref.watch(playbackSpeedProvider);

    final totalMs = duration.inMilliseconds;
    final currentMs = position.inMilliseconds;
    final sliderValue = totalMs > 0
        ? currentMs.clamp(0, totalMs).toDouble()
        : 0.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Now Playing')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const SizedBox(height: 20),
              Container(
                height: 220,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: const Icon(Icons.auto_stories, size: 90),
              ),
              const SizedBox(height: 32),
              Text(
                service.currentTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                service.currentArtist.isEmpty
                    ? 'Choose a recitation to begin'
                    : service.currentArtist,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              Slider(
                value: sliderValue,
                max: totalMs > 0 ? totalMs.toDouble() : 1,
                onChanged: service.hasAudio
                    ? (value) {
                        ref.read(audioPlayerServiceProvider).seek(
                              Duration(milliseconds: value.round()),
                            );
                      }
                    : null,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatDuration(position)),
                  Text(formatDuration(duration)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    tooltip: 'Previous Ayah',
                    onPressed: null,
                    icon: const Icon(Icons.skip_previous_rounded),
                    iconSize: 34,
                  ),
                  const SizedBox(width: 12),
                  FilledButton(
                    onPressed: service.hasAudio
                        ? () async {
                            await service.toggle();
                          }
                        : null,
                    style: FilledButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(18),
                    ),
                    child: Icon(
                      playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
                      size: 34,
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    tooltip: 'Next Ayah',
                    onPressed: null,
                    icon: const Icon(Icons.skip_next_rounded),
                    iconSize: 34,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Playback speed'),
                  DropdownButton<double>(
                    value: speed,
                    items: const [
                      DropdownMenuItem(value: 0.5, child: Text('0.5x')),
                      DropdownMenuItem(value: 0.75, child: Text('0.75x')),
                      DropdownMenuItem(value: 1.0, child: Text('1.0x')),
                      DropdownMenuItem(value: 1.25, child: Text('1.25x')),
                      DropdownMenuItem(value: 1.5, child: Text('1.5x')),
                      DropdownMenuItem(value: 2.0, child: Text('2.0x')),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        ref.read(playbackSpeedProvider.notifier).setSpeed(value);
                      }
                    },
                  ),
                ],
              ),
              if (!service.hasAudio)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    'No audio source loaded yet. Select a recitation with an audio URL to start playback.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


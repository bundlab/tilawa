import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import '../core/audio/audio_player_service.dart';

final audioPlayerServiceProvider = Provider<AudioPlayerService>((ref) {
  final service = AudioPlayerService();
  ref.onDispose(() {
    unawaited(service.dispose());
  });
  return service;
});

final playerStateProvider = StreamProvider<PlayerState>((ref) {
  return ref.watch(audioPlayerServiceProvider).player.playerStateStream;
});

final positionProvider = StreamProvider<Duration>((ref) {
  return ref.watch(audioPlayerServiceProvider).player.positionStream;
});

final durationProvider = StreamProvider<Duration?>((ref) {
  return ref.watch(audioPlayerServiceProvider).player.durationStream;
});

final isPlayingProvider = Provider<bool>((ref) {
  return ref.watch(playerStateProvider).value?.playing ?? false;
});

final playbackSpeedProvider =
    NotifierProvider<PlaybackSpeedNotifier, double>(
  PlaybackSpeedNotifier.new,
);

class PlaybackSpeedNotifier extends Notifier<double> {
  @override
  double build() => 1.0;

  Future<void> setSpeed(double value) async {
    state = value;
    await ref.read(audioPlayerServiceProvider).setSpeed(value);
  }
}

final currentAyahProvider =
    NotifierProvider<CurrentAyahNotifier, int>(
  CurrentAyahNotifier.new,
);

class CurrentAyahNotifier extends Notifier<int> {
  @override
  int build() => 1;

  void setAyah(int value) {
    state = value;
  }
}


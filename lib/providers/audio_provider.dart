import 'package:flutter_riverpod/flutter_riverpod.dart';

final isPlayingProvider = NotifierProvider<IsPlayingNotifier, bool>(
  IsPlayingNotifier.new,
);

class IsPlayingNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void setPlaying(bool value) {
    state = value;
  }

  void toggle() {
    state = !state;
  }
}

final playbackSpeedProvider = NotifierProvider<PlaybackSpeedNotifier, double>(
  PlaybackSpeedNotifier.new,
);

class PlaybackSpeedNotifier extends Notifier<double> {
  @override
  double build() => 1.0;

  void setSpeed(double value) {
    state = value;
  }
}

final currentAyahProvider = NotifierProvider<CurrentAyahNotifier, int>(
  CurrentAyahNotifier.new,
);

class CurrentAyahNotifier extends Notifier<int> {
  @override
  int build() => 1;

  void setAyah(int value) {
    state = value;
  }
}

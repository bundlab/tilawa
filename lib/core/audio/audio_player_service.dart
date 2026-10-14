import 'package:just_audio/just_audio.dart';

class AudioPlayerService {
  final AudioPlayer player = AudioPlayer();

  String currentTitle = 'No recitation selected';
  String currentArtist = '';

  bool get hasAudio => player.audioSource != null;

  Future<void> loadUrl({
    required String url,
    required String title,
    required String artist,
  }) async {
    final uri = Uri.tryParse(url);

    if (uri == null ||
        !uri.hasScheme ||
        (uri.scheme != 'http' && uri.scheme != 'https')) {
      throw ArgumentError.value(url, 'url', 'A valid HTTP(S) URL is required.');
    }

    currentTitle = title;
    currentArtist = artist;

    await player.setUrl(url);
  }

  Future<void> play() async {
    if (hasAudio) {
      await player.play();
    }
  }

  Future<void> pause() async {
    await player.pause();
  }

  Future<void> toggle() async {
    if (!hasAudio) return;

    if (player.playing) {
      await pause();
    } else {
      await play();
    }
  }

  Future<void> seek(Duration position) async {
    if (hasAudio) {
      await player.seek(position);
    }
  }

  Future<void> setSpeed(double speed) async {
    await player.setSpeed(speed);
  }

  Future<void> dispose() async {
    await player.dispose();
  }
}


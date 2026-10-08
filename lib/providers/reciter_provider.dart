import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/mock_data.dart';
import '../models/reciter.dart';

final recitersProvider = Provider<List<Reciter>>((ref) {
  return reciters;
});

final selectedReciterProvider =
    NotifierProvider<SelectedReciterNotifier, Reciter?>(
      SelectedReciterNotifier.new,
    );

class SelectedReciterNotifier extends Notifier<Reciter?> {
  @override
  Reciter? build() {
    return reciters.isNotEmpty ? reciters.first : null;
  }

  void select(Reciter reciter) {
    state = reciter;
  }
}

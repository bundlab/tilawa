import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/reciter_provider.dart';

class RecitersScreen extends ConsumerWidget {
  const RecitersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reciters = ref.watch(recitersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reciters',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reciters.length,
        itemBuilder: (context, index) {
          final reciter = reciters[index];

          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                radius: 28,
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              title: Text(
                reciter.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${reciter.country} • ${reciter.style}'),
              trailing: IconButton(
                onPressed: () {
                  ref.read(selectedReciterProvider.notifier).select(reciter);
                },
                icon: const Icon(Icons.play_circle_outline),
              ),
            ),
          );
        },
      ),
    );
  }
}

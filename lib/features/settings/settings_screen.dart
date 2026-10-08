import 'package:flutter/material.dart';

import '../../widgets/bottom_navigation.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;
  bool autoPlay = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          const _SectionTitle(title: 'Playback'),

          SwitchListTile(
            title: const Text('Auto play next Ayah'),
            subtitle: const Text('Automatically continue to the next verse.'),
            value: autoPlay,
            onChanged: (value) {
              setState(() => autoPlay = value);
            },
          ),

          ListTile(
            leading: const Icon(Icons.speed),
            title: const Text('Default playback speed'),
            subtitle: const Text('1.0x'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.timer_outlined),
            title: const Text('Sleep timer'),
            subtitle: const Text('Off'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),

          const Divider(),

          const _SectionTitle(title: 'Notifications'),

          SwitchListTile(
            title: const Text('Notifications'),
            value: notifications,
            onChanged: (value) {
              setState(() => notifications = value);
            },
          ),

          const Divider(),

          const _SectionTitle(title: 'About'),

          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About Tilawa'),
            subtitle: Text('Version 0.1.0'),
          ),
        ],
      ),
      bottomNavigationBar: const TilawaBottomNavigation(currentIndex: 3),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'router.dart';
import 'theme.dart';

class TilawaApp extends StatelessWidget {
  const TilawaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tilawa',
      debugShowCheckedModeBanner: false,
      theme: TilawaTheme.lightTheme,
      darkTheme: TilawaTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
    );
  }
}

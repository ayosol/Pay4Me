import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pay4me/ui/screens/homescreen.dart';

import 'core/theme/theme.dart';

void main() {
  runApp(ProviderScope(child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay4Me Task',
      theme: AppTheme.lightThemeMode,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

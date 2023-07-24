import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class DarkTheme extends StatefulWidget {
  const DarkTheme({super.key});

  @override
  State<DarkTheme> createState() => _DarkThemeState();
}

class _DarkThemeState extends State<DarkTheme> {
  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Provider'),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text("Light Mode"),
            value: ThemeMode.light,
            groupValue: themeprovider.themeMode,
            onChanged: themeprovider.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text("Dark Mode"),
            value: ThemeMode.dark,
            groupValue: themeprovider.themeMode,
            onChanged: themeprovider.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text("System Mode"),
            value: ThemeMode.system,
            groupValue: themeprovider.themeMode,
            onChanged: themeprovider.setTheme,
          ),
          const Icon(
            Icons.favorite,
          ),
        ],
      ),
    );
  }
}

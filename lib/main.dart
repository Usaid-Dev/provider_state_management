import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/count_provider.dart';
import 'package:provider_state_management/provider/example_multi_provider.dart';
import 'package:provider_state_management/favourite_app/favourite_provider.dart';
import 'package:provider_state_management/provider/login_provider.dart';
import 'package:provider_state_management/provider/theme_provider.dart';
import 'package:provider_state_management/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleMultiProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeprovider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            themeMode: themeprovider.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              appBarTheme: const AppBarTheme(
                color: Colors.red,
              ),
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}

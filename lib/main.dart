import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/count_provider.dart';
import 'package:provider_state_management/provider/example_multi_provider.dart';
import 'package:provider_state_management/screens/example_multi.dart';

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
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ExampleMulti(),
      ),
    );
  }
}

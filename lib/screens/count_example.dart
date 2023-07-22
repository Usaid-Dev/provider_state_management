import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        countProvider.setCount();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Example'),
      ),
      body: Center(
        child: Consumer<CountProvider>(
          builder: (context, value, child) {
            print('only this widget build');
            return Text(
              value.count.toString(),
              style: const TextStyle(
                fontSize: 50,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

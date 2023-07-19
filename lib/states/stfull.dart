import 'package:flutter/material.dart';

class StateFull extends StatefulWidget {
  const StateFull({super.key});

  @override
  State<StateFull> createState() => _StateFullState();
}

class _StateFullState extends State<StateFull> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Full'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            DateTime.now().toString(),
          ),
          Container(
            child: Center(
              child: Text(
                count.toString(),
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
          print(count);
          setState(() {});
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

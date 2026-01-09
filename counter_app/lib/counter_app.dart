import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      counter--;
    });
  }

  void reset() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter Value',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: increment,
              child: const Text('Increment'),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: decrement,
              child: const Text('Decrement'),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: reset,
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}

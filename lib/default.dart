import 'package:flutter/material.dart';

import '../Components/sidebar.dart';

class Default extends StatefulWidget {
  const Default({super.key, required this.title});

  final String title;

  @override
  State<Default> createState() => _DefaultState();
}

class _DefaultState extends State<Default> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: Center(child: Row(children: [SideBar(), Container(width: MediaQuery.of(context).size.width * 0.85)])

          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     const Text(
          //       'You have pushed the button this many times:',
          //     ),
          //     Text(
          //       '$_counter',
          //       style: Theme.of(context).textTheme.headlineMedium,
          //     ),
          //   ],
          // ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

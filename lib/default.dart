import 'package:flutter/material.dart';

class Default extends StatefulWidget {
  const Default({super.key, required this.title});

  final String title;

  @override
  State<Default> createState() => _DefaultState();
}

class _DefaultState extends State<Default> {
  int _counter = 0;
  bool sidebar = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void toggleSidebar() => setState(() => sidebar = !sidebar);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: Center(
          child: Row(children: [
        Flexible(
            fit: sidebar ? FlexFit.tight : FlexFit.loose,
            child: Container(
              // color: Color.fromRGBO(49, 59, 75, 1),
              color: Theme.of(context).colorScheme.onSecondary,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Home"),
                Text("User"),
                Text("Dictionary"),
                Text("Audit Trail"),
                Column(children: [Text("My Profile"), Text("Settings")]),
                TextButton(onPressed: () => toggleSidebar(), child: Text("Toggle"))
              ]),
            )),
        Container(width: MediaQuery.of(context).size.width * 0.85)
      ])

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

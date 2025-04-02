import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget { // This is the first page class.
  const CounterPage({super.key, required this.title});

  // This widget is the home page of your application.
  final String title;  // Title to be displayed on the AppBar. It's referencing the root widget

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;  // Initializes the counter to 0.

  // This method increments the counter when called.
  void _incrementCounter() {
    setState(() {
      // This call to setState tells Flutter that the counter has changed, so it needs to rebuild the UI.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // The build method is rerun every time setState is called.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,  // Sets the AppBar color based on the theme's inverse primary color.
        title: Text(widget.title),  // Displays the title passed from the parent widget (MyApp).
      ),
      body: Center(
        // Center widget to center-align the children widgets.
        child: Column(
          // Column widget arranges its children vertically.
          mainAxisAlignment: MainAxisAlignment.center,  // Aligns children vertically in the center of the screen.
          children: <Widget>[
            const Text('You have pushed the button this many times:'),  // A static text that describes the counter.
            Text(
              '$_counter',  // Displays the current value of the counter.
              style: _counter >= 11
                ? Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.red)  // Changes the text color to red when counter is 11 or higher.
                : Theme.of(context).textTheme.headlineMedium,  // Uses default headline style otherwise.
            ),
          ],
        ),
      ),
      floatingActionButton: Row( // WIdget for floating buttons
        mainAxisAlignment: MainAxisAlignment.end,  // Aligns the row (of buttons) to the right side of the screen.
        children: [
          // Floating action button for navigation to the navigation page.
          FloatingActionButton(
            heroTag: 'nav',  // Each FAB must have a unique heroTag when there are multiple FABs.
            onPressed: () {
              Navigator.pushNamed(context, '/navigation');  // Navigates to the '/navigation' route.
            },
            child: const Text('Nav.'),  // Text inside the button.
          ),
          const SizedBox(width: 16),  // Adds spacing between the navigation and counter buttons.
          // Floating action button for incrementing the counter.
          FloatingActionButton(
            heroTag: 'counter',  // Each FAB must have a unique heroTag when there are multiple FABs.
            onPressed: _incrementCounter,  // Calls _incrementCounter when pressed.
            tooltip: 'Increment',  // Tooltip to describe the action when the user hovers over or long-presses the button.
            child: const Icon(Icons.add),  // The icon of the button (a plus sign).
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
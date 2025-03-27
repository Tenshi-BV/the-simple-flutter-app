import 'package:flutter/material.dart';
import 'photo_handling_page.dart'; // Import the photo handling page for navigation.

class NavigationPage extends StatelessWidget { // Navigation page is a stateless widget
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme( // Wrap the Scaffold with a Theme widget to override the default text theme.
      data: Theme.of(context).copyWith( // Copy the current theme
        textTheme: Theme.of(context).textTheme.apply( // Apply a custom font (MyCustomFont) for all text.
          fontFamily: 'MyCustomFont',
        ),
      ),
      child: Scaffold( // Main scaffold of the page.
        appBar: AppBar(
          title: const Text(
            'Navigation Page', // Title of the page in the AppBar.
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Use inversePrimary for the AppBar background.
        ),
        body: Padding( // Adds padding around the content.
          padding: const EdgeInsets.all(16.0), // Padding value.
          child: Center( // Center itself in the available space.
            child: Column( // Create a column.
              crossAxisAlignment: CrossAxisAlignment.center, // Center-aligns children horizontally.
              children: [ // The children are a list of widgets that will make up the content of this page.
                const Text( // Text widget with various attributes.
                  'Back navigation',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8), // Windget for spacing between header and button.
                IntrinsicWidth( // A widget that sizes its child to the child's maximum intrinsic width.
                  child: ElevatedButton( // Elevated button
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Red color for back navigation.
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Pops the current route off the navigator.
                    },
                    child: const Text('POP'), // Text inside button.
                  ),
                ),
                const SizedBox(height: 8), // Spacing between buttons.
                ElevatedButton( // Another button.
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Red color for back navigation.
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/')); // Pops routes until reaching the route named '/'.
                  },
                  child: const Text('REMOVE UNTIL'), // Text inside button.
                ),
                const SizedBox(height: 16), // Spacing before the next section.
                const Text( // Widget for text
                  'Forward Navigation',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8), // Spacing between header and button.
                ElevatedButton( //Widget for button
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Green color for forward navigation.
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhotoHandlingPage(), // Navigate to PhotoHandlingPage.
                      ),
                    );
                  },
                  child: const Text('PUSH'),
                ),
                const SizedBox(height: 8), // Spacing between buttons.
                ElevatedButton( // FInal button widget.
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Green color for forward navigation.
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/photoHandling'); // Navigate using the named route '/photoHandling'.
                  },
                  child: const Text('PUSHNAMED'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

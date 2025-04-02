import 'package:flutter/material.dart';
import 'pages/navigation_page.dart';  // Import the navigation page for routing.
import 'pages/photo_handling_page.dart';  // Import the photo handling page for routing.
import 'package:the_simple_app/pages/counter_page.dart'; // Import the counter page
void main() {
  runApp(const MyApp());  // The entry point for the application. It runs the root widget (MyApp).
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Simple App',  // Sets the title of the application.
      theme: ThemeData(
        // This is the theme of your application, which controls the colors and fonts.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),  // Creates a color scheme from the seed color (deep purple).
      ),
      initialRoute: '/',  // Defines the initial route to load when the app starts.
      routes: {
        '/': (context) => const CounterPage(title: 'Counter Page'),  // Defines the route for the home page (CounterPage).
        '/navigation': (context) => const NavigationPage(),  // Defines the route for the navigation page.
        '/photoHandling': (context) => const PhotoHandlingPage(),  // Defines the route for the photo handling page.
      },
    );
  }
}



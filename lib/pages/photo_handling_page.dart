import 'dart:async'; // Import Dart's asynchronous utilities (e.g., Timer).
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package to use custom fonts.

// The top half of this page displays 10 boxes, each using a different google font. The bottom half of the page is a picture which toggles between different pictures when you press a button.
class PhotoHandlingPage extends StatefulWidget { // This page is a stateful widget.
  const PhotoHandlingPage({super.key});

  @override
  _PhotoHandlingPageState createState() => _PhotoHandlingPageState();
}

class _PhotoHandlingPageState extends State<PhotoHandlingPage> {
  
  String imagePath = 'assets/images/hori-1.jpg'; // Holds the current image path. This is used to switch between two images.

  Timer? _timer; // Timer variable that will be used to periodically execute code.

  // A list of text styles using various Google Fonts.
  final List<TextStyle> fontStyles = [
    GoogleFonts.lato(fontSize: 20),
    GoogleFonts.robotoSlab(fontSize: 20),
    GoogleFonts.pacifico(fontSize: 20),
    GoogleFonts.oswald(fontSize: 20),
    GoogleFonts.montserrat(fontSize: 20),
    GoogleFonts.dancingScript(fontSize: 20),
    GoogleFonts.indieFlower(fontSize: 20),
    GoogleFonts.anton(fontSize: 20),
    GoogleFonts.playfairDisplay(fontSize: 20),
    GoogleFonts.lobster(fontSize: 20),
  ];

  // Function to toggle between two images.
  void switchImage() {
    setState(() {
      // If current image is hori-1.jpg, switch to hori-2.jpg, otherwise switch back.
      imagePath = imagePath == 'assets/images/hori-1.jpg'
          ? 'assets/images/hori-2.jpg'
          : 'assets/images/hori-1.jpg';
    });
  }

  @override
  // initState() is used to initialize state before the widget is built. In this case, it initializes a periodic timer that prints "tick tock" to the terminal every 3 seconds.
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      print('tick tock');
    });
  }

  @override
  // dispose() is used to clean up resources when the widget is removed from the widget tree. It cancels the timer to free resources and prevents memory leaks when the page is no longer in view.
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Root page scaffold widget
      appBar: AppBar(
        title: const Text('Photo Handling Page'), // Title for the AppBar.
      ),
      body: Column( // Creates a colomn for the whole content.
        children: [
          // Top half: Displays 10 text strings with different fonts using a Wrap widget.
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Adds padding around the Wrap widget.
              child: Wrap(
                spacing: 8.0, // Horizontal spacing between children.
                runSpacing: 8.0, // Vertical spacing between lines.
                // Generate 10 chips, each with a unique text and style.
                children: List.generate(10, (index) {
                  return Chip(
                    label: Text(
                      'Text ${index + 1}', // Display text for each chip.
                      style: fontStyles[index], // Apply the corresponding font style.
                    ),
                  );
                }),
              ),
            ),
          ),
          // Bottom half: Displays an image that fills the available space.
          Expanded(
            flex: 1,
            child: Image.asset(
              imagePath, // Uses the current image path.
              fit: BoxFit.cover, // Ensures the image covers the container, cropping if necessary.
            ),
          ),
        ],
      ),
      // Floating action button to switch between images.
      floatingActionButton: FloatingActionButton(
        onPressed: switchImage, // Calls switchImage to toggle the image.
        child: const Icon(Icons.swap_horiz), // Icon to indicate image switching.
      ),
    );
  }
}

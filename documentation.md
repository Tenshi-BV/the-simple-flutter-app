# The Simple App Documentation
## 1. Overview / Introduction
### The Simple App is a Flutter application that demonstrates:
* Navigation between multiple pages.
* Usage of custom fonts (both Google Fonts and imported assets).
* Dynamic image switching.
* Periodic tasks using timers (printing "tick tock" every 3 seconds).

This project is designed to showcase basic Flutter concepts like routing, theming, state management, and widget composition.

## 2. Getting Started / Setup
### Prerequisites:
* Flutter SDK: Version 3.7.0 or higher.
* Dart SDK: Comes with Flutter.
* Visual Studio Code: With the Dart and Flutter extensions installed.

### Installation Instructions:
  1. Clone the repository
  2. Install dependencies by running flutter pub get
  3. Run the app with flutter run

### Directory Structure:
the_simple_app/
├── assets/
│   ├── fonts/
│   │   └── MarckScript-Regular.ttf
│   └── images/
│       ├── hori-1.jpg
│       └── hori-2.jpg
├── lib/
│   ├── main.dart
│   └── pages/
│       ├── navigation_page.dart
│       └── photo_handling_page.dart
├── pubspec.yaml
├── documentation.md
└── README.md

lib/main.dart: Contains the app’s entry point, routing, and theme configuration.

lib/pages/navigation_page.dart: Implements navigation controls and demonstrates custom theming with an imported font.

lib/pages/photo_handling_page.dart: Displays text in various Google Fonts, an image that can be switched, and uses a timer to print periodic messages.

## 3. Architecture / Code Structure
### High-Level Architecture
MaterialApp:
The MaterialApp in main.dart sets up the application’s title, theme, initial route, and routes. This acts as the foundation for routing and theming throughout the app.

Widgets:
* Stateless Widgets: Used for pages that don’t need to manage internal state (e.g., NavigationPage).
* Stateful Widgets: Used for pages with dynamic state. For example, PhotoHandlingPage is stateful to manage image switching and timer functionality.

### Routing and Navigation
Named Routes:
Defined in main.dart, enabling navigation via:
* / for the CounterPage.
* /navigation for the NavigationPage.
* /photoHandling for the PhotoHandlingPage.

Navigation Methods:
* Using Navigator.pushNamed() to navigate via a named route.
* Using Navigator.push() with MaterialPageRoute for custom route transitions.
* Navigator.pop() and Navigator.popUntil() for back navigation.

### Theming and Custom Fonts
Custom Theme:
The app’s theme is set up in main.dart using ThemeData with a seeded color scheme (deep purple).

Imported Custom Font:
In pubspec.yaml, a custom font is declared under the fonts section.

fonts:
  - family: MyCustomFont
    fonts:
      - asset: assets/fonts/MarckScript-Regular.ttf

Local Theme Override:
In NavigationPage, the Theme widget is used to apply the custom font (MyCustomFont) to all text widgets on that page.

## 4. Detailed Component Documentation

### Main.dart
- Purpose:
Acts as the entry point to the application. It initializes the MaterialApp, defines the theme, and sets up the routes.

- Key Sections:
  - MaterialApp Setup:
    Configures title, theme, and routes.

  - CounterPage:
    A stateful widget that demonstrates basic state management with a counter.

    - _CounterPageState: Contains the counter logic and UI, including two FloatingActionButtons: one for navigating to the NavigationPage and another for incrementing the counter.

### NavigationPage.dart
- Purpose:
  Provides navigation options to move between pages. It demonstrates using a locally applied theme to override text styles with the custom font.

- Key Components:

  - Theme Override:
    Wraps the page in a Theme widget to apply MyCustomFont to all text.

  - Navigation Buttons:
    Buttons for back navigation (POP and REMOVE UNTIL) and forward navigation (PUSH and PUSHNAMED) with clear color coding (red for back, green for forward).

### PhotoHandlingPage.dart
- Purpose:
  Displays two main sections: a top section with text items styled with various Google Fonts, and a bottom section showing an image that can be switched.

- Key Components:

  - Dynamic Image Switching:
    Uses a state variable imagePath and a switchImage() function to toggle between two images.

  - Timer:
    A periodic timer (initialized in initState()) prints “tick tock” every 3 seconds. The timer is canceled in dispose() to avoid resource leaks.

  - UI Layout:
    Uses a Column with two Expanded widgets: one for a Wrap of Chip widgets showing text, and one for the image (with BoxFit.cover to ensure it fills its container).

## 5. Usage Examples

### Navigating Between Pages
- From the CounterPage:

  - Press “Nav.” Button:
    Navigates to the NavigationPage.

  - Press “+” Button:
    Increments the counter. When the counter reaches 11 or above, the number changes to red.

- On the NavigationPage:

  - Back Navigation:
    The POP button returns to the previous screen, while the REMOVE UNTIL button navigates back to the root.

  - Forward Navigation:
    The PUSH and PUSHNAMED buttons both navigate to the PhotoHandlingPage.

### Customizing the App
- Custom Fonts:
  To change the custom font, update the font file in assets/fonts/ and adjust the pubspec.yaml if necessary.

- Images:
  Place additional images in assets/images/ and modify the image paths in the code as needed.

## 6. Development & Contribution Guidelines

### Coding Standards
- The project uses the flutter_lints package to enforce best practices and maintain consistent code style.

- Follow Dart and Flutter best practices when adding or modifying code.

### How to Contribute
1. Fork the Repository: Create your fork of the project.
2. Create a Feature Branch: Make your changes on a new branch.
3. Commit Changes: Ensure your code follows the linting rules and is well-commented.
4. Submit a Pull Request: Provide a detailed description of your changes.

### Testing
Run tests (if available) using flutter test

## 7. Troubleshooting and FAQ

### Common Issues
- Custom Font Not Displaying:

  - Verify that the font file exists at the specified path.

  - Ensure that flutter pub get has been run.

  - Do a full restart of the app (hot-reload may not pick up asset changes).

- Timer Not Stopping:

  - Make sure that the timer is being cancelled in the dispose() method.

### FAQ
- Q: Why do I see white space around the image?
  A: The image is set to BoxFit.cover to fill its container; if the aspect ratio doesn’t match perfectly, parts of the image may be cropped.

- Q: How do I change the theme colors?
  A: Update the ThemeData in main.dart to customize colors.

## 8. Appendix
Changelog
- v1.0.0:

  - Initial release featuring navigation, custom fonts, dynamic image switching, and a periodic timer.

Additional Resources
Flutter Documentation: https://flutter.dev/docs

Dart Language Tour: https://dart.dev/guides/language/language-tour

Google Fonts Package: https://pub.dev/packages/google_fonts
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LightDarkModeToggle extends StatelessWidget {
  const LightDarkModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return GestureDetector(
      onTap: () {
        themeProvider.toggleThemeMode(); // Toggle the theme mode
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFD6E1FF),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 3),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ListTile(
            leading: Icon(
              isDarkMode ? Icons.dark_mode : Icons.light_mode,
              color: Colors.black,
              size: 25,
            ),
            title: const Text('Toggle Dark Mode'),
            textColor: Colors.black,
          ),
        ),
      ),
    );
  }
}

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleThemeMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

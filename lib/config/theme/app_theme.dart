import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 146, 112, 241);

const List<Color> _colorThemes = [
  Colors.purpleAccent,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.lime,
  _customColor
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'Invalid color index');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        // brightness: Brightness.dark,
        colorSchemeSeed: _colorThemes[selectedColor]);
  }
}

import 'package:flutter/material.dart';

class BookThemeProvider extends ChangeNotifier {
  final _primarySwatchColorCode = 0xff7972E6;
  final MaterialColor _primarySwatch = Colors.grey;

  int get primarySwatchColorCode => _primarySwatchColorCode;
  MaterialColor get primarySwatch => _primarySwatch;
}

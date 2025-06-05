import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  /// Un notifier se compone de dos partes:
  /// - Un estado (en este caso, el valor de isDarkMode en true o false)
  /// - Un método para cambiar el estado (en este caso, el setter isDarkMode)
  /// y notificar a los listeners (en este caso, notifyListeners())
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}

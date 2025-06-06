import 'package:flutter_test/flutter_test.dart';
import 'package:services_app/notifiers/theme_notifier.dart';

void main() {
  test('ThemeNotifier toggles dark mode', () {
    final notifier = ThemeNotifier();
    expect(notifier.isDarkMode, isFalse);

    notifier.isDarkMode = true;
    expect(notifier.isDarkMode, isTrue);
  });
}

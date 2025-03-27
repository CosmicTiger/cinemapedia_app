import 'package:cinemapedia_app/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Changes between Light or Dark Mode
final isDarkModeProvider = StateProvider<bool>((ref) => true);

/// List of colors that can be used in the application and are immutable.
final colorListProvider = Provider((ref) => colorList);

/// NOTE: Selected color is a StateProvider because it will change the color of the whole application.
final selectedColorProvider = StateProvider<int>((ref) => 0);

/// NOTE: We create this provider to handle the StateNotifier implementation to apply several changes
/// globally in our app.

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

/// NOTE: The naming convention should be either with Notifier prefix or Controller
class ThemeNotifier extends StateNotifier<AppTheme> {
  /// NOTE: State = new AppTheme()
  ThemeNotifier() : super(AppTheme());

  /// NOTE: With this technique we are assuring to create once the instance related to the AppTheme to handle the creation of the class as a Singleton patterm.

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int index) {
    state = state.copyWith(selectedColor: index);
  }
}

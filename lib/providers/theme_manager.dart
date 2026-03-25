import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ThemeManager extends ChangeNotifier {
  bool _isDarkMode = false;
  
  bool get isDarkMode => _isDarkMode;
  
  ThemeManager() {
    _loadTheme();
  }
  
  void _loadTheme() async {
    notifyListeners();
  }
  
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
  
  void setTheme(bool isDark) {
    _isDarkMode = isDark;
    notifyListeners();
  }
  
  ThemeData getTheme() {
    return _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
  }
  
  Color getTextColor(BuildContext context) {
    return AppTheme.getTextColor(context);
  }
  
  Color getBackgroundColor(BuildContext context) {
    return AppTheme.getBackgroundColor(context);
  }
  
  Color getCardColor(BuildContext context) {
    return AppTheme.getCardColor(context);
  }
}
import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../providers/theme_manager.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDark = themeManager.isDarkMode;

    return Scaffold(
      appBar: const CustomAppBar(title: 'أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ§أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أƒآ¢أ¢آ‚آ¬أ¢آ€آچأکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أƒآ¢أ¢آ‚آ¬أ‚آ¦أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ¸أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أƒآ¢أ¢آ‚آ¬أکآŒأکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ±'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.light_mode, color: AppTheme.goldColor),
              title: const Text(''),
              trailing: Radio<ThemeMode>(
                value: ThemeMode.light,
                groupValue: themeManager.isDarkMode ? ThemeMode.dark : ThemeMode.light,
                onChanged: (v) => themeManager.setDarkMode(false),
              ),
              onTap: () => themeManager.setDarkMode(false),
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode, color: AppTheme.goldColor),
              title: const Text(''),
              trailing: Radio<ThemeMode>(
                value: ThemeMode.dark,
                groupValue: themeManager.isDarkMode ? ThemeMode.dark : ThemeMode.light,
                onChanged: (v) => themeManager.setDarkMode(true),
              ),
              onTap: () => themeManager.setDarkMode(true),
            ),
            ListTile(
              leading: const Icon(Icons.brightness_auto, color: AppTheme.goldColor),
              title: const Text(''),
              trailing: Radio<ThemeMode>(
                value: ThemeMode.system,
                groupValue: themeManager.isDarkMode ? ThemeMode.dark : ThemeMode.light, // أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أƒآ¢أ¢آ‚آ¬أ‚آ¦أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ¨أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ³أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ·
                onChanged: (v) => themeManager.setDarkMode(MediaQuery.platformBrightnessOf(context) == Brightness.dark),
              ),
              onTap: () {
                final systemDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
                themeManager.setDarkMode(systemDark);
              },
            ),
          ],
        ),
      ),
    );
  }
}
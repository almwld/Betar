import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLanguage = 'ar';

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø§ÙÙØºØ©'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          RadioListTile<String>(
            title: const Text('Ø§ÙØ¹Ø±Ø¨ÙØ©', style: TextStyle(fontFamily: 'Changa')),
            value: 'ar',
            groupValue: _selectedLanguage,
            activeColor: AppTheme.goldColor,
            onChanged: (value) => setState(() => _selectedLanguage = value!),
          ),
          RadioListTile<String>(
            title: const Text('English', style: TextStyle(fontFamily: 'Changa')),
            value: 'en',
            groupValue: _selectedLanguage,
            activeColor: AppTheme.goldColor,
            onChanged: (value) => setState(() => _selectedLanguage = value!),
          ),
        ],
      ),
    );
  }
}
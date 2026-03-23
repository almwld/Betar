import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class UniversitiesScreen extends StatelessWidget {
  const UniversitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'ØªØ¹ÙÙÙ Ø¹Ø§ÙÙ'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.school, size: 80, color: AppTheme.goldColor.withOpacity(0.5)),
            const SizedBox(height: 16),
            Text('Ø®Ø¯ÙØ§Øª Ø§ÙØªØ¹ÙÙÙ Ø§ÙØ¹Ø§ÙÙ', style: TextStyle(fontFamily: 'Changa', fontSize: 24, color: AppTheme.getTextColor(context))),
          ],
        ),
      ),
    );
  }
}
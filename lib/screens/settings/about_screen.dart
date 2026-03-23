import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø¹Ù Ø§ÙØªØ·Ø¨ÙÙ'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(gradient: AppTheme.goldGradient, borderRadius: BorderRadius.circular(24)),
              child: const Icon(Icons.shopping_bag, size: 50, color: AppTheme.darkText),
            ),
            const SizedBox(height: 24),
            Text('Flex Yemen', style: TextStyle(fontFamily: 'Changa', fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.getTextColor(context))),
            const SizedBox(height: 8),
            Text('Ø§ÙØ¥ØµØ¯Ø§Ø± 1.0.0', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getSecondaryTextColor(context))),
            const SizedBox(height: 24),
            Text('ÙÙØµØ© Ø§ÙØªØ¬Ø§Ø±Ø© Ø§ÙØ¥ÙÙØªØ±ÙÙÙØ© Ø§ÙÙÙÙÙØ©', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getSecondaryTextColor(context))),
            const SizedBox(height: 8),
            Text('support@flexyemen.com', style: TextStyle(fontFamily: 'Changa', color: AppTheme.goldColor)),
          ],
        ),
      ),
    );
  }
}
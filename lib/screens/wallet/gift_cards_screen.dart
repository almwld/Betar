import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class GiftCardsScreen extends StatelessWidget {
  const GiftCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø¨Ø·Ø§ÙØ§Øª ÙØª'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.card_giftcard, size: 80, color: AppTheme.goldColor.withOpacity(0.5)),
            const SizedBox(height: 16),
            Text('Ø¨Ø·Ø§ÙØ§Øª Ø§ÙÙØ¯Ø§ÙØ§', style: TextStyle(fontFamily: 'Changa', fontSize: 24, color: AppTheme.getTextColor(context))),
          ],
        ),
      ),
    );
  }
}
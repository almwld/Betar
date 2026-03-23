import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class MoneyTransfersScreen extends StatelessWidget {
  const MoneyTransfersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'ØªØ­ÙÙÙØ§Øª ÙØ§ÙÙØ©'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.send, size: 80, color: AppTheme.goldColor.withOpacity(0.5)),
            const SizedBox(height: 16),
            Text('Ø§ÙØªØ­ÙÙÙØ§Øª Ø§ÙÙØ§ÙÙØ©', style: TextStyle(fontFamily: 'Changa', fontSize: 24, color: AppTheme.getTextColor(context))),
          ],
        ),
      ),
    );
  }
}
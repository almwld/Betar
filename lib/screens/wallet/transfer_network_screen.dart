import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class TransferNetworkScreen extends StatelessWidget {
  const TransferNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø´Ø¨ÙØ© Ø§ÙØªØ­ÙÙÙ'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.network_check, size: 80, color: AppTheme.goldColor.withOpacity(0.5)),
            const SizedBox(height: 16),
            Text('Ø´Ø¨ÙØ© Ø§ÙØªØ­ÙÙÙ', style: TextStyle(fontFamily: 'Changa', fontSize: 24, color: AppTheme.getTextColor(context))),
            const SizedBox(height: 8),
            Text('ÙØ±ÙØ¨Ø§Ù', style: TextStyle(fontFamily: 'Changa', fontSize: 16, color: AppTheme.getSecondaryTextColor(context))),
          ],
        ),
      ),
    );
  }
}
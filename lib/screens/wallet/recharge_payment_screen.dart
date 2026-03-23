import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class RechargePaymentScreen extends StatelessWidget {
  const RechargePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø´Ø­Ù ÙØ³Ø¯Ø§Ø¯'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone_android, size: 80, color: AppTheme.goldColor.withOpacity(0.5)),
            const SizedBox(height: 16),
            Text('Ø§ÙØ´Ø­Ù ÙØ§ÙØ³Ø¯Ø§Ø¯', style: TextStyle(fontFamily: 'Changa', fontSize: 24, color: AppTheme.getTextColor(context))),
          ],
        ),
      ),
    );
  }
}
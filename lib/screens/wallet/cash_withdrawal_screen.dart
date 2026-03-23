import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class CashWithdrawalScreen extends StatelessWidget {
  const CashWithdrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø³Ø­Ø¨ ÙÙØ¯Ù'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.money, size: 80, color: AppTheme.goldColor.withOpacity(0.5)),
            const SizedBox(height: 16),
            Text('Ø§ÙØ³Ø­Ø¨ Ø§ÙÙÙØ¯Ù', style: TextStyle(fontFamily: 'Changa', fontSize: 24, color: AppTheme.getTextColor(context))),
          ],
        ),
      ),
    );
  }
}
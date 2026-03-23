import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø·Ø±Ù Ø§ÙØ¯ÙØ¹'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.account_balance_wallet, color: AppTheme.goldColor),
              title: Text('Ø§ÙÙØ­ÙØ¸Ø© Ø§ÙØ¥ÙÙØªØ±ÙÙÙØ©', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
              subtitle: const Text('Ø§ÙØ±ØµÙØ¯: 125,000 Ø±.Ù', style: TextStyle(fontFamily: 'Changa')),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.credit_card, color: AppTheme.goldColor),
              title: Text('Ø¨Ø·Ø§ÙØ© Ø§Ø¦ØªÙØ§ÙÙØ©', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
              subtitle: const Text('**** **** **** 1234', style: TextStyle(fontFamily: 'Changa')),
              trailing: TextButton(
                onPressed: () {},
                child: const Text('Ø¥Ø¶Ø§ÙØ©', style: TextStyle(fontFamily: 'Changa', color: AppTheme.goldColor)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
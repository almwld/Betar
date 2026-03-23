import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_app_bar.dart';

class SecuritySettingsScreen extends StatelessWidget {
  const SecuritySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø§ÙØ£ÙØ§Ù'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.lock_outline, color: AppTheme.goldColor),
                title: Text('ØªØºÙÙØ± ÙÙÙØ© Ø§ÙÙØ±ÙØ±', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.fingerprint, color: AppTheme.goldColor),
                title: Text('Ø§ÙÙØµØ§Ø¯ÙØ© Ø§ÙØ¨ÙÙÙØªØ±ÙØ©', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.devices, color: AppTheme.goldColor),
                title: Text('Ø¥Ø¯Ø§Ø±Ø© Ø§ÙØ£Ø¬ÙØ²Ø©', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø§ÙÙØ³Ø§Ø¹Ø¯Ø© ÙØ§ÙØ¯Ø¹Ù'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.help_outline, color: AppTheme.goldColor),
              title: Text('Ø§ÙØ£Ø³Ø¦ÙØ© Ø§ÙØ´Ø§Ø¦Ø¹Ø©', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.pushNamed(context, '/faq'),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.chat_bubble_outline, color: AppTheme.goldColor),
              title: Text('ØªÙØ§ØµÙ ÙØ¹ÙØ§', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.pushNamed(context, '/contact_us'),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.support_agent, color: AppTheme.goldColor),
              title: Text('Ø§ÙØ¯Ø¹Ù Ø§ÙÙÙÙ', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.pushNamed(context, '/live_support'),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import 'faq_screen.dart';
import 'contact_us_screen.dart';
import 'support_tickets_screen.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});
  final List<Map<String, dynamic>> _items = const [
    {'title': 'Ø§ÙØ£Ø³Ø¦ÙØ© Ø§ÙØ´Ø§Ø¦Ø¹Ø©', 'icon': Icons.question_answer, 'screen': FaqScreen()},
    {'title': 'ØªÙØ§ØµÙ ÙØ¹ÙØ§', 'icon': Icons.contact_mail, 'screen': ContactUsScreen()},
    {'title': 'Ø§ÙØ¯Ø¹Ù Ø§ÙÙÙÙ', 'icon': Icons.support_agent, 'screen': SupportTicketsScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙÙØ³Ø§Ø¹Ø¯Ø© ÙØ§ÙØ¯Ø¹Ù'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _items.length,
        itemBuilder: (_, i) {
          final item = _items[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              leading: Icon(item['icon'], color: AppTheme.goldColor),
              title: Text(item['title']),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => item['screen'])),
            ),
          );
        },
      ),
    );
  }
}
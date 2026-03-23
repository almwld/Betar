import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  final List<Map<String, dynamic>> _settings = const [
    {'title': 'Ø§ÙØ¥Ø´Ø¹Ø§Ø±Ø§Øª', 'icon': Icons.notifications, 'color': Colors.blue},
    {'title': 'Ø§ÙØ£ÙØ§Ù ÙØ§ÙØ®ØµÙØµÙØ©', 'icon': Icons.security, 'color': Colors.green},
    {'title': 'Ø§ÙÙØºØ©', 'icon': Icons.language, 'color': Colors.orange},
    {'title': 'Ø·Ø±Ù Ø§ÙØ¯ÙØ¹', 'icon': Icons.payment, 'color': Colors.purple},
    {'title': 'Ø§ÙÙØ³Ø§Ø¹Ø¯Ø© ÙØ§ÙØ¯Ø¹Ù', 'icon': Icons.help, 'color': Colors.teal},
    {'title': 'Ø¹Ù Ø§ÙØªØ·Ø¨ÙÙ', 'icon': Icons.info, 'color': Colors.red},
    {'title': 'Ø³ÙØ§Ø³Ø© Ø§ÙØ®ØµÙØµÙØ©', 'icon': Icons.privacy_tip, 'color': Colors.indigo},
    {'title': 'ØªÙÙÙÙ Ø§ÙØªØ·Ø¨ÙÙ', 'icon': Icons.star, 'color': Colors.amber},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ¥Ø¹Ø¯Ø§Ø¯Ø§Øª'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _settings.length,
        itemBuilder: (_, i) {
          final item = _settings[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(item['icon'], color: item['color']),
              title: Text(item['title']),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item['title']} - ÙÙØ¯ Ø§ÙØªØ·ÙÙØ±')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
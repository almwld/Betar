import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class NotificationHistoryScreen extends StatelessWidget {
  const NotificationHistoryScreen({super.key});

  final List<Map<String, dynamic>> _notifications = const [
    {'title': 'Ø¹Ø±Ø¶ Ø®Ø§Øµ', 'message': 'Ø®ØµÙ 20% Ø¹ÙÙ Ø¬ÙÙØ¹ Ø§ÙØ¥Ø¹ÙØ§ÙØ§Øª', 'time': 'ÙÙØ° Ø³Ø§Ø¹Ø©', 'read': false},
    {'title': 'Ø±Ø³Ø§ÙØ© Ø¬Ø¯ÙØ¯Ø©', 'message': 'Ø£Ø­ÙØ¯ ÙØ­ÙØ¯ Ø£Ø±Ø³Ù ÙÙ Ø±Ø³Ø§ÙØ©', 'time': 'ÙÙØ° 3 Ø³Ø§Ø¹Ø§Øª', 'read': false},
    {'title': 'ØªÙØª Ø§ÙÙÙØ§ÙÙØ©', 'message': 'ØªÙØª Ø§ÙÙÙØ§ÙÙØ© Ø¹ÙÙ Ø¥Ø¹ÙØ§ÙÙ', 'time': 'ÙÙØ° ÙÙÙ', 'read': true},
    {'title': 'ØªÙ Ø§ÙØ´Ø­Ù', 'message': 'ØªÙ Ø´Ø­Ù Ø·ÙØ¨Ù Ø±ÙÙ #123', 'time': 'ÙÙØ° ÙÙÙÙÙ', 'read': true},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø³Ø¬Ù Ø§ÙØ¥Ø´Ø¹Ø§Ø±Ø§Øª'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _notifications.length,
        itemBuilder: (ctx, i) {
          final n = _notifications[i];
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
              borderRadius: BorderRadius.circular(12),
              border: !n['read'] ? Border.all(color: AppTheme.goldColor, width: 1) : null,
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppTheme.goldColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.notifications, color: AppTheme.goldColor),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(n['title'], style: TextStyle(fontWeight: !n['read'] ? FontWeight.bold : FontWeight.normal)),
                      const SizedBox(height: 4),
                      Text(n['message'], style: TextStyle(color: Colors.grey[600])),
                      const SizedBox(height: 4),
                      Text(n['time'], style: TextStyle(fontSize: 11, color: Colors.grey[500])),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
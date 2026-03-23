import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class ChangelogScreen extends StatelessWidget {
  const ChangelogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø³Ø¬Ù Ø§ÙØªØ­Ø¯ÙØ«Ø§Øª'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildVersionCard('Ø§ÙØ¥ØµØ¯Ø§Ø± 1.0.0', '2024-01-15', ['Ø¥Ø·ÙØ§Ù Ø§ÙØªØ·Ø¨ÙÙ', 'Ø¥Ø¶Ø§ÙØ© Ø§ÙÙØ­ÙØ¸Ø© Ø§ÙØ¥ÙÙØªØ±ÙÙÙØ©', 'ÙØ¸Ø§Ù Ø§ÙØ¯Ø±Ø¯Ø´Ø©']),
        ],
      ),
    );
  }

  Widget _buildVersionCard(String version, String date, List<String> changes) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(version, style: const TextStyle(fontFamily: 'Changa', fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.goldColor)), Text(date, style: const TextStyle(fontFamily: 'Changa', color: AppTheme.darkTextSecondary))]),
            const SizedBox(height: 12),
            ...changes.map((change) => Padding(padding: const EdgeInsets.only(bottom: 4), child: Row(children: [const Icon(Icons.check_circle, color: AppTheme.success, size: 16), const SizedBox(width: 8), Text(change, style: const TextStyle(fontFamily: 'Changa'))]))),
          ],
        ),
      ),
    );
  }
}
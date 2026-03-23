import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_app_bar.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'ØªÙØ§ØµÙÙ Ø§ÙØ·ÙØ¨'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ø·ÙØ¨ #1001', style: TextStyle(fontFamily: 'Changa', fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.getTextColor(context))),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(color: AppTheme.success.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                          child: const Text('ÙÙØªÙÙ', style: TextStyle(fontFamily: 'Changa', color: AppTheme.success)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow('Ø§ÙØªØ§Ø±ÙØ®', '2024-01-15'),
                    _buildInfoRow('Ø§ÙØ¥Ø¬ÙØ§ÙÙ', '150,000 Ø±.Ù'),
                    _buildInfoRow('Ø·Ø±ÙÙØ© Ø§ÙØ¯ÙØ¹', 'Ø§ÙÙØ­ÙØ¸Ø©'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Ø§ÙÙÙØªØ¬Ø§Øª', style: TextStyle(fontFamily: 'Changa', fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.getTextColor(context))),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(color: AppTheme.goldColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.phone_android, color: AppTheme.goldColor),
                ),
                title: Text('Ø¢ÙÙÙÙ 15', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
                subtitle: const Text('Ø§ÙÙÙÙØ©: 1', style: TextStyle(fontFamily: 'Changa')),
                trailing: const Text('450,000 Ø±.Ù', style: TextStyle(fontFamily: 'Changa', color: AppTheme.goldColor, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(text: 'ØªØªØ¨Ø¹ Ø§ÙØ·ÙØ¨', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontFamily: 'Changa', color: AppTheme.darkTextSecondary)),
          Text(value, style: const TextStyle(fontFamily: 'Changa', fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
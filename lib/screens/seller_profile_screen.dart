import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_app_bar.dart';

class SellerProfileScreen extends StatelessWidget {
  const SellerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'ÙÙÙ Ø§ÙØ¨Ø§Ø¦Ø¹'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(gradient: AppTheme.goldGradient, borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30))),
              child: Column(
                children: [
                  const CircleAvatar(radius: 50, backgroundColor: Colors.white, child: Icon(Icons.store, size: 50, color: AppTheme.goldColor)),
                  const SizedBox(height: 16),
                  const Text('ÙØªØ¬Ø± Ø§ÙØªÙÙÙØ©', style: TextStyle(fontFamily: 'Changa', fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.darkText)),
                  const SizedBox(height: 8),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [const Icon(Icons.star, color: Colors.amber, size: 20), const SizedBox(width: 4), const Text('4.9', style: TextStyle(fontFamily: 'Changa', color: AppTheme.darkText))]),
                  const SizedBox(height: 16),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [_buildStat('Ø§ÙØ¥Ø¹ÙØ§ÙØ§Øª', '45'), _buildStat('Ø§ÙÙØ¨ÙØ¹Ø§Øª', '120'), _buildStat('Ø§ÙÙØªØ§Ø¨Ø¹ÙÙ', '500')]),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(children: [
                Expanded(child: CustomButton(text: 'ÙØªØ§Ø¨Ø¹Ø©', onPressed: () {})),
                const SizedBox(width: 12),
                Expanded(child: CustomButton(text: 'ÙØ­Ø§Ø¯Ø«Ø©', onPressed: () => Navigator.pushNamed(context, '/chat_detail'), isOutlined: true)),
              ]),
            ),
            const SizedBox(height: 24),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Text('Ø¥Ø¹ÙØ§ÙØ§Øª Ø§ÙØ¨Ø§Ø¦Ø¹', style: TextStyle(fontFamily: 'Changa', fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.getTextColor(context)))),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(children: [Text(value, style: const TextStyle(fontFamily: 'Changa', fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.darkText)), Text(label, style: const TextStyle(fontFamily: 'Changa', fontSize: 12, color: AppTheme.darkText))]);
  }
}
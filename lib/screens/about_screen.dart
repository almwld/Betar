import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø¹Ù Ø§ÙØªØ·Ø¨ÙÙ'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [AppTheme.goldColor, AppTheme.goldLight]),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(Icons.shopping_bag, size: 60, color: Colors.black),
            ),
            const SizedBox(height: 20),
            const Text('Flex Yemen', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Ø§ÙØ¥ØµØ¯Ø§Ø± 1.0.0', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            const Text(
              'ÙÙØµØ© ØªØ¬Ø§Ø±Ø© Ø¥ÙÙØªØ±ÙÙÙØ© ÙÙÙÙØ© ÙØªÙØ§ÙÙØ© ØªÙØ¯Ù Ø¥ÙÙ ØªØ³ÙÙÙ Ø§ÙØ¨ÙØ¹ ÙØ§ÙØ´Ø±Ø§Ø¡ ÙØªÙÙÙØ± Ø®Ø¯ÙØ§Øª ÙØ§ÙÙØ© ÙØªÙÙØ¹Ø©.',
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.5),
            ),
            const SizedBox(height: 40),
            ListTile(
              leading: const Icon(Icons.code, color: AppTheme.goldColor),
              title: const Text('Ø§ÙÙØ·ÙØ±'),
              subtitle: const Text('ÙØ±ÙÙ Flex Yemen'),
            ),
            ListTile(
              leading: const Icon(Icons.email, color: AppTheme.goldColor),
              title: const Text('Ø§ÙØ¨Ø±ÙØ¯ Ø§ÙØ¥ÙÙØªØ±ÙÙÙ'),
              subtitle: const Text('support@flexyemen.com'),
            ),
            ListTile(
              leading: const Icon(Icons.web, color: AppTheme.goldColor),
              title: const Text('Ø§ÙÙÙÙØ¹ Ø§ÙØ¥ÙÙØªØ±ÙÙÙ'),
              subtitle: const Text('www.flexyemen.com'),
            ),
          ],
        ),
      ),
    );
  }
}
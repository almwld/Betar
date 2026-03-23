import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import 'package:share_plus/share_plus.dart';

class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø¯Ø¹ÙØ© Ø§ÙØ£ØµØ¯ÙØ§Ø¡'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppTheme.goldColor, AppTheme.goldLight],
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.people, size: 60, color: Colors.black),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ø§Ø¯Ø¹Ù Ø£ØµØ¯ÙØ§Ø¡Ù ÙØ§Ø­ØµÙ Ø¹ÙÙ ÙÙØ§ÙØ¢Øª',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Changa'),
            ),
            const SizedBox(height: 8),
            const Text(
              'ÙÙÙ ØµØ¯ÙÙ ÙØ³Ø¬Ù Ø¹Ø¨Ø± Ø±Ø§Ø¨Ø·ÙØ Ø³ØªØ­ØµÙ Ø¹ÙÙ 100 ÙÙØ·Ø©',
              style: TextStyle(color: Colors.grey, fontFamily: 'Changa'),
            ),
            const SizedBox(height: 30),
            const Text('Ø±Ø§Ø¨Ø· Ø§ÙØ¯Ø¹ÙØ© Ø§ÙØ®Ø§Øµ Ø¨Ù:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'https://flexyemen.app/r/USER123',
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy, color: AppTheme.goldColor),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Share.share('Ø§ÙØ¶Ù Ø¥ÙÙ Ø¹ÙÙ Flex Yemen Ø¹Ø¨Ø± Ø§ÙØ±Ø§Ø¨Ø·: https://flexyemen.app/r/USER123'),
                icon: const Icon(Icons.share),
                label: const Text('ÙØ´Ø§Ø±ÙØ© Ø§ÙØ±Ø§Ø¨Ø·'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.goldColor,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
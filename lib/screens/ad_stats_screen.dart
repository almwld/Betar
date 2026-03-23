import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AdStatsScreen extends StatelessWidget {
  final String adId;
  const AdStatsScreen({super.key, required this.adId});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: const Text('Ø¥Ø­ØµØ§Ø¦ÙØ§Øª Ø§ÙØ¥Ø¹ÙØ§Ù', style: TextStyle(fontFamily: 'Changa'))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text('Ø¢ÙÙÙÙ 14 Ø¨Ø±Ù ÙØ§ÙØ³', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                      _buildStatItem(Icons.visibility, 'Ø§ÙÙØ´Ø§ÙØ¯Ø§Øª', '1,250'),
                      _buildStatItem(Icons.phone, 'Ø§ÙØ§ØªØµØ§ÙØ§Øª', '34'),
                      _buildStatItem(Icons.chat, 'Ø§ÙÙØ­Ø§Ø¯Ø«Ø§Øª', '12'),
                    ]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Ø§ÙØ³Ø¨Ø¹Ø© Ø£ÙØ§Ù Ø§ÙØ£Ø®ÙØ±Ø©', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: Card(child: Center(child: Text('Ø±Ø³Ù Ø¨ÙØ§ÙÙ Ø³ÙØ¶Ø§Ù ÙØ§Ø­ÙØ§Ù'))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: AppTheme.goldColor, size: 30),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PromoteAdScreen extends StatelessWidget {
  const PromoteAdScreen({super.key});

  final List<Map<String, dynamic>> packages = const [
    {'name': 'Ø¹Ø§Ø¯Ù', 'days': 7, 'price': '500', 'views': '100-200'},
    {'name': 'ÙØ¶Ù', 'days': 14, 'price': '900', 'views': '300-500'},
    {'name': 'Ø°ÙØ¨Ù', 'days': 30, 'price': '1500', 'views': '1000+'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: const Text('ØªØ±ÙÙØ¬ Ø§ÙØ¥Ø¹ÙØ§Ù', style: TextStyle(fontFamily: 'Changa'))),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: packages.length,
        itemBuilder: (ctx, i) {
          final p = packages[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(p['name'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Ø§ÙÙØ¯Ø©: ${p['days']} ÙÙÙ'),
                  Text('Ø§ÙÙØ´Ø§ÙØ¯Ø§Øª Ø§ÙÙØªÙÙØ¹Ø©: ${p['views']}'),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${p['price']} Ø±ÙØ§Ù', style: const TextStyle(color: AppTheme.goldColor, fontSize: 20, fontWeight: FontWeight.bold)),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: AppTheme.goldColor),
                        child: const Text('ØªØ±ÙÙØ¬ Ø§ÙØ¢Ù'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
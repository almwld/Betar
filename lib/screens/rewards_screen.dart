import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  final List<Map<String, dynamic>> _rewards = const [
    {'action': 'Ø¯Ø¹ÙØ© ØµØ¯ÙÙ', 'points': 100, 'status': 'ÙÙØªÙÙ', 'date': '2026-03-15'},
    {'action': 'Ø£ÙÙ Ø¥Ø¹ÙØ§Ù', 'points': 50, 'status': 'ÙÙØªÙÙ', 'date': '2026-03-10'},
    {'action': 'Ø£ÙÙ Ø¹ÙÙÙØ© Ø´Ø±Ø§Ø¡', 'points': 200, 'status': 'ÙØ¹ÙÙ', 'date': '-'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙÙÙØ§ÙØ¢Øª'),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTheme.goldColor, AppTheme.goldLight],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.card_giftcard, size: 40, color: Colors.black),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('ÙÙØ§Ø·Ù Ø§ÙØ­Ø§ÙÙØ©', style: TextStyle(color: Colors.black87, fontFamily: 'Changa')),
                    const SizedBox(height: 4),
                    Text('1,250 ÙÙØ·Ø©', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Changa')),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text('Ø³Ø¬Ù Ø§ÙÙÙØ§ÙØ¢Øª', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Changa')),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _rewards.length,
              itemBuilder: (ctx, i) {
                final r = _rewards[i];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: r['status'] == 'ÙÙØªÙÙ' ? Colors.green.withOpacity(0.2) : Colors.orange.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        r['status'] == 'ÙÙØªÙÙ' ? Icons.check : Icons.pending,
                        color: r['status'] == 'ÙÙØªÙÙ' ? Colors.green : Colors.orange,
                      ),
                    ),
                    title: Text(r['action']),
                    subtitle: Text('${r['points']} ÙÙØ·Ø© â¢ ${r['date']}'),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: r['status'] == 'ÙÙØªÙÙ' ? Colors.green.withOpacity(0.2) : Colors.orange.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        r['status'],
                        style: TextStyle(
                          color: r['status'] == 'ÙÙØªÙÙ' ? Colors.green : Colors.orange,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
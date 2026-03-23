import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class NearbyStoresScreen extends StatelessWidget {
  const NearbyStoresScreen({super.key});

  final List<Map<String, dynamic>> _stores = const [
    {'name': 'ÙØªØ¬Ø± Ø§ÙØªÙÙÙØ©', 'distance': '500 Ù', 'rating': 4.5},
    {'name': 'ÙØ¹Ø±Ø¶ Ø§ÙØ³ÙØ§Ø±Ø§Øª', 'distance': '1.2 ÙÙ', 'rating': 4.2},
    {'name': 'ÙÙØªØ¨ Ø§ÙØ¹ÙØ§Ø±Ø§Øª', 'distance': '800 Ù', 'rating': 4.8},
    {'name': 'ÙØ·Ø¹Ù ÙÙÙÙÙ', 'distance': '300 Ù', 'rating': 4.3},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙÙØªØ§Ø¬Ø± Ø§ÙÙØ±ÙØ¨Ø©'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _stores.length,
        itemBuilder: (ctx, i) {
          final s = _stores[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.store, color: AppTheme.goldColor),
              title: Text(s['name']),
              subtitle: Text('${s['distance']} â¢ â­ ${s['rating']}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
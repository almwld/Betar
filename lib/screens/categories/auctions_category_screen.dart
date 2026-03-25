import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class AuctionsCategoryScreen extends StatelessWidget {
  const AuctionsCategoryScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'ÙØ²Ø§Ø¯Ø§Øª Ø³ÙØ§Ø±Ø§Øª', 'icon': Icons.directions_car, 'color': Colors.red, 'count': '12'},
    {'name': 'ÙØ²Ø§Ø¯Ø§Øª Ø¹ÙØ§Ø±Ø§Øª', 'icon': Icons.home, 'color': Colors.green, 'count': '8'},
    {'name': 'ÙØ²Ø§Ø¯Ø§Øª ØªØ­Ù', 'icon': Icons.history, 'color': Colors.brown, 'count': '15'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙÙØ²Ø§Ø¯Ø§Øª'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final cat = _categories[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: (cat['color'] as Color).withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: (cat['color'] as Color).withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(cat['icon'] as IconData, color: cat['color']),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cat['name'], style: const TextStyle(fontFamily: 'Changa', fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text('${cat['count']} ÙØ²Ø§Ø¯ ÙØ´Ø·', style: const TextStyle(fontFamily: 'Changa', fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
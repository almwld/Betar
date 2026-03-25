import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class DonationsScreen extends StatelessWidget {
  const DonationsScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'ØªØ¨Ø±Ø¹Ø§Øª ÙØ§ÙÙØ©', 'icon': Icons.volunteer_activism, 'color': Colors.green, 'count': '45'},
    {'name': 'ØªØ¨Ø±Ø¹Ø§Øª Ø¹ÙÙÙØ©', 'icon': Icons.card_giftcard, 'color': Colors.orange, 'count': '23'},
    {'name': 'Ø­ÙÙØ§Øª Ø®ÙØ±ÙØ©', 'icon': Icons.favorite, 'color': Colors.red, 'count': '12'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØªØ¨Ø±Ø¹Ø§Øª'),
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
                        Text('${cat['count']} Ø­ÙÙØ©', style: const TextStyle(fontFamily: 'Changa', fontSize: 12, color: Colors.grey)),
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
import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class HandicraftsAntiquesScreen extends StatelessWidget {
  const HandicraftsAntiquesScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'Ø¬ÙØ§Ø¨Ù', 'icon': Icons.agriculture, 'color': Colors.brown, 'count': '234'},
    {'name': 'Ø³Ø¬Ø§Ø¯ ÙØ¯ÙÙ', 'icon': Icons.carpenter, 'color': Colors.red, 'count': '123'},
    {'name': 'ÙØ¶ÙØ§Øª', 'icon': Icons. diamond, 'color': Colors.grey, 'count': '89'},
    {'name': 'ÙØ­Ø§Ø³ÙØ§Øª', 'icon': Icons.kitchen, 'color': Colors.amber, 'count': '67'},
    {'name': 'ØªØ­Ù Ø£Ø«Ø±ÙØ©', 'icon': Icons.history, 'color': Colors.brown, 'count': '45'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ­Ø±Ù ÙØ§ÙØªØ­Ù'),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final cat = _categories[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: (cat['color'] as Color).withOpacity(0.3)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: (cat['color'] as Color).withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(cat['icon'] as IconData, color: cat['color']),
                  ),
                  const SizedBox(height: 8),
                  Text(cat['name'], style: const TextStyle(fontFamily: 'Changa', fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('${cat['count']} ÙØ·Ø¹Ø©', style: const TextStyle(fontFamily: 'Changa', fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}